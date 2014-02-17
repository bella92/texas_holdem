class Table
  attr_reader :deck, :players, :board, :pot

  def initialize()
    @deck = Deck.new
    @players = []
    @board = []
    @pot = 0
  end

  def add_player(player)
    @players << player
  end

  def remove_player(player)
    @players.delete(player)
  end

  def add_cards_to_board(cards)
    @board.concat(cards)
  end

  def clear_board
    @board = []
  end

  def increase_pot(amount)
    @pot += amount
  end

  def clear_pot
    @pot = 0
  end
end