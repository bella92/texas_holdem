require_relative "card.rb"

class Deck
  attr_accessor :cards

  def initialize
    @cards = (2..14).flat_map do |rank|
      (1..4).map { |suit| Card.new(rank, suit) }
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def take_cards(cards_count)
    cards = @cards.pop(cards_count)
    return cards
  end
end