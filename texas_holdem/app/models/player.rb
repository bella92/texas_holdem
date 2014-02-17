class Player
  attr_accessor :name, :pocket, :bankroll

  def initialize(name)
    @name = name
    @pocket = []
    @bankroll = 1000
  end
end