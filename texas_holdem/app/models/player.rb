class Player
  attr_accessor :name, :pocket, :bankroll

  def initialize(name, pocket, bankroll)
    @name = name
    @pocket = []
    @bankroll = 1000
  end
end