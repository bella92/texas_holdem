require_relative "table.rb"

class Dealer
  attr_reader :deck, :table

  def initialize(table)
    @deck = Deck.new
    @table = table
  end

  def deal_to_players
    2.times do
      @table.players.foreach do |player|
        cards = @deck.take_cards(1)
        player.add_cards_to_pocket(cards)
      end
    end
  end

  def deal_to_board(count)
    cards = @deck.take_cards(count, skip: 1)
    @table.add_cards_to_board(cards)
  end
end