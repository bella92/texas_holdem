require_relative "pot.rb"

class Pots
  attr_reader :pots

  def initialize
    @pots = [Pot.new]
  end
    
  def add_bet(player, amount)
    pot_surplus = @pots.first.add_bet(player, amount)
    add_side_pot(pot_surplus) if pot_surplus != {}
  end
  
  def pay_winners(winners)
    @pots.each do |pot|
      betted_winners = find_betted_winners (winners)
      betted_winners.each { |winner| winner.increase_bankroll(pot.amount / betted_winners.size) }
      pot.clear
    end
    #@pots.reduce { |sum, pot| sum + pot.amount } <= 0
  end

  #not tested
  def max_bet
    @pots.reduce { |sum, pot| pot.max_bet}
  end

  private

  def add_side_pot(pot_surplus)
    @pots << Pot.new
    pot_surplus.keys.each { |player| @pots.last.add_bet(player, pot_surplus[player]) }
  end

  def find_betted_winners(winners)
    winners.select { |winner| @pots.last.player_called?(winner) }
  end
end
