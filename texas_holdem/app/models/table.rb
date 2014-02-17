class Table
  attr_accessor :deck, :players, :board, :pot

  def initialize()
    @deck = Deck.new
    @players = []
    @board = []
    @pot = 0
  end

  def add_player(player)
    @players.push(player)
  end

  def remove_player(player)
    @players.delete(player)
  end

  def increase_pot(amount)
    @pot += amount
  end

  def clear_pot
    @pot = 0
  end
end