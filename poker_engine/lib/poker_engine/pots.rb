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
        
  def add_bet(player, amount)
    index_surpassed = @pots.first_index { |pot| pot.player_called?(player) }
    surplus = @pots[index_surpassed].add_bet(player, amount)
    add_side_pot(surplus)
  end
  
  private

  def add_side_pot(pot_surplus)
    @pots << Pot.new if index_surpassed == @pots.size - 1
    surplus.keys.each { |player| pots[index_surpassed + 1].add_bet(player, surplus[player]) }
  end
end
