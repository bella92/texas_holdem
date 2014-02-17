require 'spec_helper'
 
describe Player do
  before :each do
    @player = Player.new("My player")
  end

  describe "#new" do
    it "takes one parameter and returns a Player object" do
      expect(@player).to be_an_instance_of(Player)
    end
  end

  describe "#name" do
    it "returns the correct name" do
      expect(@player.name).to eq("My player")
    end
  end

  describe "#pocket" do
    it "returns an empty pocket" do
      expect(@player.pocket).to be_empty
    end
  end

  describe "#bankroll" do
    it "returns the default bankroll" do
      expect(@player.bankroll).to eq(1000)
    end
  end
end