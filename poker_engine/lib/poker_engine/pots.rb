class Pots
  attr_reader :pots

  def initialize
    @pots = [Pot.new]
  end

  def pay_winners(winners)
    pots.each do |pot|
      betted_winners = winners.select { |winner| pot.player_betted?(winner) }
      betted_winners.each { |winner| winner.increase_bankroll(pot.amount / betted_winners.size) }
      pot.clear
    end
    pots.reduce { |sum, pot| sum + pot.amount } > 0 ? false : true
  end
        
  def add_chips(player, amount)
  end