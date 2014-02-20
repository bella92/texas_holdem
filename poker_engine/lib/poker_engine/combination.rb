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
    @hand.group_by { |card| card.suit } #.sort_by { |_, cards| -cards.count }
  end

  def group_by_rank
    @hand.group_by { |card| card.rank } #.sort_by { |_, cards| -cards.count }
  end

  def map_suit_count
    (1..4).map { |suit| group_by_suit.key?(suit) ? group_by_suit[suit].count : 0 }.join
  end

  def map_rank_count
    (2..14).map { |rank| group_by_rank.key?(rank) ? group_by_rank[rank].count : 0 }.join
  end

  def straight?
    rank_count = map_rank_count
    rank_count.insert(0, rank_count[-1, 1])
    !(rank_count =~ /[^0]{5}/).nil?
  end

  def find_combination
    !array.index(3).nil? and !array.index(2).nil?
    combination = if !(map_suit_count =~ /[^0]{5}/).nil? and straight?
                    COMBINATIONS[8] #StraightFlush
  end
end

combination = Combination.new([Card.new(4, 4),
                               Card.new(5, 2),
                               Card.new(6, 2),
                               Card.new(7, 3),
                               Card.new(8, 3),
                               Card.new(6, 3),
                               Card.new(5, 1)])
p combination.straight?
