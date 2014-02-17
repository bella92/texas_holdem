require_relative "table.rb"

class Dealer
  attr_accessor :deck, :board, :players

  def initialize(table)
    @deck = table.deck.shuffle
    @board = table.board
    @players = table.players
  end

  def deal_to_players
    2.times do
      @players.foreach do |player|
        cards = @deck.take_cards(1)
        player.pocket.concat(cards)
      end
    end
  end

  def deal_to_board(cards_count)
    @deck.pop(1)
    cards = deck.take_cards(cards_count)
    board.concat(cards)
  end
end