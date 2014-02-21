require_relative "card.rb"

class Hand
  HANDS = { "HighCard" => 1, "Pair" => 2, "TwoPairs" => 3, "ThreeOfaKind" => 4, "Straight" => 5, "Flush" => 6,
            "FullHouse" => 7, "FourOfaKind" => 8, "StraightFlush" => 9, "RoyalFlush" => 10 }

  attr_reader :cards, :hand, :high_cards, :kickers

  def initialize(cards)
    @cards = cards
    @hand = 1
    @high_cards = []
    @kickers = []
  end

  def find_best_hand
    @hand = if (@high_cards[0] = Hand.new(group_by_suit[0].last).straight?) == 0
              HANDS["RoyalFlush"]
            elsif @high_cards[0] = Hand.new(group_by_suit[0].last).straight?
              HANDS["StraightFlush"]
            elsif @high_cards[0] = rank_count.index('4')
              HANDS["FourOfaKind"]
            elsif (@high_cards[0] = rank_count.index('3')) and (@high_cards[1] = rank_count.index('3', @high_cards[0] + 1) or rank_count.index('2'))
              HANDS["FullHouse"]
            elsif @high_cards[0] = suit_count.index(/[567]/)
              HANDS["Flush"]
            elsif @high_cards[0] = straight?
              HANDS["Straight"]
            elsif @high_cards[0] = rank_count.index('3')
              HANDS["ThreeOfaKind"]
            elsif (@high_cards[0] = rank_count.index('2')) and @high_cards[1] = rank_count.index('2', @high_cards[0] + 1)
              HANDS["TwoPairs"]
            elsif @high_cards[0] = rank_count.index('2')
              HANDS["Pair"]
            elsif @high_cards[0] = rank_count.index('1')
              HANDS["HighCard"]
            end
  end

  def find_kickers
    other_cards = rank_count
    other_cards[@high_cards[0]] = '0'
    @kickers = case @hand
               when 8, 3
                 [] << other_cards.index('1')
               when 4
                 (0...other_cards.length).find_all { |c| other_cards[c, 1] == '1' }.take(2)
               when 2
                 (0...other_cards.length).find_all { |c| other_cards[c, 1] == '1' }.take(3)
               else
                 (0...other_cards.length).find_all { |c| other_cards[c, 1] == '1' }.take(4)
               end
    @high_cards.map! { |high_card| 14 - high_card.to_i }
    @kickers.map! { |kicker| 14 - kicker.to_i }
  end

  def <=>(other)
    find_best_hand
    find_kickers
    other.find_best_hand
    other.find_kickers
    if @hand == other.hand
      @high_cards != other.high_cards ? @high_cards <=> other.high_cards : @kickers <=> other.kickers
    else
      @hand <=> other.hand
    end
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