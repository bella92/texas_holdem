class Player
  Fold, Check, Bet, Call, Raise, AllIn = 1.upto(6)
  None, Dealer, SmallBlind, BigBlind = 1.upto(4)

  attr_reader :name, :pocket, :bankroll

  attr_accessor :betting_status, :dealing_status

  def initialize(name)
    @name = name
    @pocket = []
    @bankroll = 1000
    @betting_status = Check
    @buck = None
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