require 'spec_helper'
 
describe Player do
  let(:player) { Player.new("My player") }
  let(:first_card) { Card.new(10, 4) }
  let(:second_card) { Card.new(13, 2) }

  describe "#new" do
    it "sets the correct name" do
      expect(player.name).to eq("My player")
    end

    it "sets an empty pocket" do
      expect(player.pocket).to be_empty
    end

    it "sets the default bankroll" do
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
      player.increase_bankroll(500)
      expect(player.bankroll).to eq(1500)
    end
  end

  describe "#decrease_bankroll" do
    it "decreases the bankroll" do
      player.decrease_bankroll(500)
      expect(player.bankroll).to eq(500)
    end
  end
end