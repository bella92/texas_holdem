require_relative '../../lib/poker_engine.rb'
 
describe Player do
  let(:player) { Player.new("My player", true) }
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

    it "sets the default all_in" do
      expect(player.all_in?).to be_true
    end

    it "sets the default buck" do
      expect(player.buck?).to be_true
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

  describe "#all_in?" do
    it "returns if player is all-in" do
      player.all_in(true)
      expect(player.all_in?).to be_true
    end
  end

  describe "#buck?" do
    it "returns if player has buck" do
      player.buck(true)
      expect(player.buck?).to be_true
    end
  end
end