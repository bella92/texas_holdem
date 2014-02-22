require_relative "pot.rb"

class Table
  attr_reader :players, :board, :pot

  def initialize
    @players = []
    @board = []
    @pot = Pot.new
  end

  def add_player(player)
    @players << player
  end

  def remove_player(player)
    @players.delete(player)
  end

  def rotate_players
    @players = @players.rotate
  end

  def add_cards_to_board(cards)
    @board.concat(cards)
  end

  def clear_board
    @board = []
  end
end