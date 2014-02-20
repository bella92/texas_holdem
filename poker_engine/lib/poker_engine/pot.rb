class Pot
  attr_reader :pot, :all_in_cap

  def initialize
    @pot = Hash.new { 0 }
    @all_in_cap = 0
  end

  def add_bet(player, amount)
    @pot[player] += amount
    @all_in_cap = amount if player.all_in? and @all_in_cap.zero?
    @all_in_cap.zero? ? {} : surplus
  end

  def players_called_cap?
    @pot.values.all? { |bet| bet == @all_in_cap } and !@all_in_cap.zero?
  end

  #not sure if needed anyway

  #def players_betted_same?
  #  @pot.values.uniq.size == 1
  #end

  def player_called?(player)
    @all_in_cap.zero? or @pot[player] == @pot.values.max or player.all_in?
  end

  def amount
    @pot.values.reduce(:+)
  end

  def clear
    @pot.clear
  end

  private

  def surplus
    surplus = @pot.select { |player, bet| bet > @all_in_cap }
    update(surplus)
    surplus
  end
  
  def update(surplus)
    surplus.keys.each do |player|
      surplus[player] = @pot[player] - @all_in_cap
      @pot[player] = @all_in_cap
    end
  end
end
