require_relative "deck.rb"

class Dealer
  attr_reader :deck

  def initialize()
    @deck = Deck.new
  end

  def deal_preflop(table)
    2.times do
      table.players.each do |player|
        cards = @deck.take_cards(1)
        player.add_cards_to_pocket(cards)
      end
    end
  end

  def deal_to_board(table, count)
    cards = @deck.take_cards(count, skip: 1)
    table.add_cards_to_board(cards)
  end
end