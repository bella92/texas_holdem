class Player
  Fold, Check, Bet, Call, Raise = 1, 2, 3, 4, 5

  attr_reader :name, :pocket, :bankroll

  attr_writer :buck

  attr_accessor :betting_status

  def initialize(name)
    @name = name
    @pocket = []
    @bankroll = 1000
    @buck = false
    @betting_status = Check
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

  def buck?
    @buck
  end
end