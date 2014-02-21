class Player
  attr_reader :name, :pocket, :bankroll

  attr_writer :all_in, :buck

  def initialize(name)
    @name = name
    @pocket = []
    @bankroll = 1000
    @all_in = false
    @buck = false
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

  def all_in?
    @all_in
  end

  def buck?
    @buck
  end
end