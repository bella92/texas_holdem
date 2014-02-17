require_relative "card.rb"

class Deck
  attr_accessor :cards

  def initialize
    @cards = (2..14).flat_map { |rank| (1..4).map { |suit| Card.new(rank, suit) } }.shuffle!
  end
  
  def take_cards(count, skip: 0)
    @cards.pop(skip)
    @cards.pop(count)
  end
end