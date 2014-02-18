class Card
  RANKS = { 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8",
            9 => "9", 10 => "10", 11 => "J", 12 => "Q", 13 => "K", 14 => "A"}
  SUITS = { 1 => "Clubs", 2 => "Diamonds", 3 => "Hearts", 4 => "Spades"}


  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def <=>(other)
    @rank != other.rank ? @rank <=> other.rank : @suit <=> other.suit
  end

  def to_s
    "#{RANKS[@rank]} of #{SUITS[@suit]}"
  end
end