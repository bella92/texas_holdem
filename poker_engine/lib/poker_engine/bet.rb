class Bet
  Fold, Check, Bet, Call, Raise = 1.upto(5)

	attr_reader :players_betting

  def initialize(pot, players_betting)
    @pot = pot
    @players_betting = players_betting
    @allowed_bets = [Fold, Check, Bet]
  end

  def fold(player)
    @players_betting.pop(player)
    player.betting_status = Fold
  end

  def check(player)
    player.betting_status = Check
  end

  def bet(player, amount)
    allowed_bets.concat([Call, Raise])
    allowed_bets.delete(Check)
    pot.add_bet(player, amount)
    player.betting_status = Bet
  end

  def call(player)
    pot.add_bet(player, pot.max_bet)
    player.betting_status = Call
  end

  def raise(player, amount)
    allowed_bets.delete(Bet)
    pot.add_bet(player, amount)
    player.betting_status = Raise
  end
end