# module Patterns
#   CLUBS, DIAMONDS, HEARTS, SPADES = 1, 2, 3, 4
#   JACK, QUEEN, KING, ACE = 11, 12, 13, 14

#   PREFLOP, FLOP, TURN, RIVER = 1, 2, 3, 4 # for dealer
# end

class Card
  RANKS = {2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9", 10 => "10", 11 => "J", 12 => "Q", 13 => "K", 14 => "A"}
  SUITS = {1 => "Clubs", 2 => "Diamonds", 3 => "Hearts", 4 => "Spades"}

  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def ==(other)
    @rank == other.rank and @suit == other.suit
  end

  def to_s
    "#{RANKS[@rank]}, #{SUITS[@suit]}"
  end
end