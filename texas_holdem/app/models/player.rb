class Player
  attr_reader :name, :pocket, :bankroll

  def initialize(name)
    @name = name
    @pocket = []
    @bankroll = 1000
  end

  def add_cards_to_pocket(cards)
    @pocket.concat(cards)
  end

  def clear_pocket
    @pocket = []
  end

  def increase_bankroll(amount)
    @bankroll += amount
  end

  def decrease_bankroll(amount)
    @bankroll -= amount
  end
end