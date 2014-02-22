class Action
  Fold, Check, Bet, Call, Raise = 1.upto(5)
  ACTIONS = { Fold => "fold", Check => "check", Bet => "bet", Call => "call", Raise => "raise"}

	attr_reader :players_betting

  def initialize(pot, players_betting)
    @pot = pot
    @players_betting = players_betting
    @allowed_bets = [Fold, Check, Bet]
  end

  def fold(player)
    @players_betting.pop(player)
    player.betting_status = ACTIONS[Fold]
  end

  def check(player)
    player.betting_status = ACTIONS[Check]
  end

  def bet(player, amount)
    @allowed_bets.concat([Call, Raise])
    @allowed_bets.delete(Check)
    @pot.add_bet(player, amount)
    player.betting_status = ACTIONS[Bet]
  end

  def call(player)
    @pot.add_bet(player, @pot.bet_difference(player))
    player.betting_status = ACTIONS[Call]
  end

  def raise(player, amount)
    @allowed_bets.delete(Bet)
    @pot.add_bet(player, amount)
    player.betting_status = ACTIONS[Raise]
  end
end