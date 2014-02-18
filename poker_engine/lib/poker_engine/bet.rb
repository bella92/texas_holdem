class Bet
	attr_reader :bet_type, :amount

  def initialize(bet_type, amount)
    @bet_type = bet_type
    @amount = amount
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