class Deck
  RANKS = 2..14
  SUITS = %w(Spades Hearts Diamonds Clubs)

  attr_accessor :cards

  def initialize
    @cards = RANKS.flat_map do |rank|
      SUITS.map { |suit| Card.new(rank, suit) }
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal(cards_count)
    cards = @cards.pop(cards_count)
    return cards
  end
end