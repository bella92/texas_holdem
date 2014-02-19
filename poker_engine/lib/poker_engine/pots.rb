class Pots
  attr_reader :pots

  def initialize
    @pots = [Pot.new]
  end

  def pay_winners(winners)
    @pots.each do |pot|
      betted_winners = winners.select { |winner| !pot.pot[winner].zero? }
      betted_winners.each { |winner| winner.increase_bankroll(pot.amount / betted_winners.size) }
      pot.clear
    end
    @pots.reduce { |sum, pot| sum + pot.amount } <= 0
  end
        
  def add_chips(player, amount)
    last_pot = @pots.select { |pot| pot.player_called?(player) }.size - 1
    pot_surplus = @pots[last_pot].add_bet(player, amount)
    if pot_surplus.size > 0
      if last_pot
        
      end
    end
  end