require_relative "card.rb"

class Hand
  HANDS = { "HighCard" => 1, "Pair" => 2, "TwoPairs" => 3, "ThreeOfaKind" => 4, "Straight" => 5, "Flush" => 6,
            "FullHouse" => 7, "FourOfaKind" => 8, "StraightFlush" => 9, "RoyalFlush" => 10 }

  attr_reader :cards, :hand, :high_card, :kickers

  def initialize(cards)
    @cards = cards
    @hand = 1
    @high_card = 2
    @kickers = []
  end

  def find_best_hand
    @hand = if (@high_card = Hand.new(group_by_suit[0].last).straight?) == 0
              HANDS["RoyalFlush"]
            elsif @high_card = Hand.new(group_by_suit[0].last).straight?
              HANDS["StraightFlush"]
            elsif @high_card = rank_count.index('4')
              HANDS["FourOfaKind"]
            elsif (@high_card = rank_count.index('3')) and (rank_count.index('3', @high_card + 1) or rank_count.index('2'))
              HANDS["FullHouse"]
            elsif @high_card = suit_count.index(/[567]/)
              HANDS["Flush"]
            elsif @high_card = straight?
              HANDS["Straight"]
            elsif @high_card = rank_count.index('3')
              HANDS["ThreeOfaKind"]
            elsif (@high_card = rank_count.index('2')) and rank_count.index('2', @high_card + 1)
              HANDS["TwoPairs"]
            elsif @high_card = rank_count.index('2')
              HANDS["Pair"]
            elsif @high_card = rank_count.index('1')
              HANDS["HighCard"]
            end       
  end

  def find_kickers
    kickers = rank_count
    hand_cards_count = kickers[@high_card].to_i
    p "count: " << hand_cards_count.to_s
    kickers[@high_card] = '0'
    sum = 0
    kickers.split('').map { |char| char.to_i }.take_while { |e| (sum += e) <= 5 - hand_cards_count }
  end

  # private

  def group_by_suit
    @cards.group_by { |card| card.suit }.sort.reverse
  end

  def suit_count
    (1..4).map { |suit| @cards.count { |card| card.suit == suit } }.reverse.join
  end

  def rank_count
    (2..14).map { |rank| @cards.count { |card| card.rank == rank } }.reverse.join
  end

  def straight?
    rank_count.insert(-1, rank_count[0, 1]).index(/[^0]{5}/)
  end
end