require_relative "enum.rb"

class Card
  RANKS = Enum.new("Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace")
  SUITS = Enum.new("Clubs", "Diamonds", "Hearts", "Spades")

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def <=>(other)
    @rank != other.rank ? @rank <=> other.rank : @suit <=> other.suit
  end

  def to_s
    "#{RANKS[@rank]}, #{SUITS[@suit]}"
  end
end

card = Card.new(:Five, "Clubs")
puts :baba