require_relative "card.rb"

class Combination
  COMBINATIONS = { 0 => "HighCard", 1 => "Pair", 2 => "TwoPairs", 3 => "ThreeOfaKind",
                   4 => "Straight", 5 => "Flush", 6 => "FullHouse",
                   7 => "FourOfaKind", 8 => "StraightFlush", 9 => "RoyalFlush" }

  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end
    
  def group_by_suit
    @hand.group_by { |card| card.suit }.sort_by { |_, cards| -cards.count }
  end

  def group_by_rank
    @hand.group_by { |card| card.rank } #.sort_by { |_, cards| -cards.count }
  end

  def straight?
    (2..14).map { |rank| group_by_rank.key?(rank) ?  }
  end

  # def find_combination
  #   combination = if sort_by_suit.at(0).at(1) >= 5 and 
  #                   COMBINATIONS[9]
  # end
end

combination = Combination.new([Card.new(4, 4),
                               Card.new(5, 2),
                               Card.new(6, 2),
                               Card.new(7, 3),
                               Card.new(8, 3),
                               Card.new(6, 3),
                               Card.new(5, 1)])
p combination.straight?