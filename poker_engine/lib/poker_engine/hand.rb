require_relative "card.rb"

class Hand
  HANDS = { 0 => "HighCard", 1 => "Pair", 2 => "TwoPairs", 3 => "ThreeOfaKind",
            4 => "Straight", 5 => "Flush", 6 => "FullHouse",
            7 => "FourOfaKind", 8 => "StraightFlush", 9 => "RoyalFlush" }

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def find_best_hand
    hand = if Hand.new(group_by_suit[0].last).straight? == 0
             HANDS[9]
           elsif Hand.new(group_by_suit[0].last).straight?
             HANDS[8]
           elsif rank_count.index('4')
             HANDS[7]
           elsif first = rank_count.index('3') and (rank_count.index('3', first + 1) or rank_count.index('2'))
             HANDS[6]
           elsif suit_count.index(/[567]/)
             HANDS[5]
           elsif straight?
             HANDS[4]
           elsif rank_count.index('3')
             HANDS[3]
           elsif first = rank_count.index('2') and rank_count.index('2', first + 1)
             HANDS[2]
           elsif rank_count.index('2')
             HANDS[1]
           else
             HANDS[0]
           end       
  end

  # private

  def group_by_suit
    @cards.group_by { |card| card.suit }.sort.reverse
  end

  # def group_by_rank
  #   @cards.group_by { |card| card.rank }.sort.reverse
  # end

  def suit_count
    (1..4).map { |suit| @cards.count { |card| card.suit == suit } }.reverse.join
  end

  def rank_count
    #p @cards
    (2..14).map { |rank| @cards.count { |card| card.rank == rank } }.reverse.join
  end

  def straight?
    rank_count.insert(-1, rank_count[0, 1]).index(/[^0]{5}/)
  end
end