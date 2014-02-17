require_relative "table.rb"

class Dealer
  attr_accessor :table

  def initialize(table)
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

  def deal_to_board(cards_count)
    @deck.pop(1)
    cards = deck.take_cards(cards_count)
    @table.add_cards_to_board(cards)
  end
end