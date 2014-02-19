class Pot
  attr_reader :pot, :all_in_cap

  def initialize
    @pot = Hash.new { 0 }
    @all_in_cap = 0
  end

  def add_bet(player, amount)
    @pot[player] += amount
    @all_in_cap = @pot[player] if player.all_in? and @all_in_cap.zero?
    overage unless @all_in_cap.zero?
  end

  def players_betted_cap?
    @pot.values.all? { |bet| bet == @all_in_cap } and !@all_in_cap.zero?
  end

  def players_betted_same?
    @pot.values.uniq.size == 1
  end

  def player_called?(player)
    @all_in_cap.zero? or @pot[player] == @pot.values.max
  end

  def amount
    @pot.reduce(:+)
  end

  private

  def overage
    @pot.keys.select { |player| player > @all_in_cap }.inject({}) do |overage, player|
      overage[player] = @pot
      @pot[player] = @all_in_cap
      overage
    end
  end
end