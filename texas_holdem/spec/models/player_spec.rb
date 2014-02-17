require 'spec_helper'
 
describe Player do
  let(:player) { Player.new("My player") }
  let(:first_card) { Card.new(10, 4) }
  let(:second_card) { Card.new(13, 2) }

  describe "#name" do
    it "returns the correct name" do
      expect(player.name).to eq("My player")
    end
  end

  describe "#pocket" do
    it "returns an empty pocket" do
      expect(player.pocket).to be_empty
    end
  end

  describe "#bankroll" do
    it "returns the default bankroll" do
      expect(player.bankroll).to eq(1000)
    end
  end

  describe "#add_cards_to_pocket" do
    it "adds cards to the pocket" do
      cards = [first_card, second_card]
      player.add_cards_to_pocket(cards)
      expect(player.pocket).to eq(cards)
    end
  end

  describe "#clear_pocket" do
    it "clears the pocket" do
      player.clear_pocket
      expect(player.pocket).to be_empty
    end
  end

  describe "#increase_bankroll" do
    it "increases the bankroll" do
      amount = 500
      player.increase_bankroll(amount)
      expect(player.bankroll).to eq(1500)
    end
  end

  describe "#decrease_bankroll" do
    it "decreases the bankroll" do
      amount = 500
      player.decrease_bankroll(amount)
      expect(player.bankroll).to eq(500)
    end
  end
end