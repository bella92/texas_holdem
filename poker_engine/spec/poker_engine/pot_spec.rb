require_relative '../../lib/poker_engine.rb'
 
describe Pot do
  let(:pot) { Pot.new }
  let(:all_in_player) { Player.new("All-in player", true) }
  let(:not_all_in_player) { Player.new("Not all-in player", false) }

  describe "#new" do
    it "sets a pot with zero bet for all players" do
      expect(pot.pot).to eq(Hash.new { 0 })
    end

    it "sets a zero all-in cap" do
      expect(pot.all_in_cap).to eq(0)
    end
  end

  describe "#add_bet" do
    it "increases the pot from player" do
      pot.add_bet(not_all_in_player, 500)
      expect(pot.pot[not_all_in_player]).to eq(500)
    end

    it "doesn't increase the all-in cap if player isn't all-in" do
      pot.add_bet(not_all_in_player, 500)
      expect(pot.all_in_cap).to eq(0)
    end

    it "increases the all-in cap if player is all-in" do
      pot.add_bet(all_in_player, 500)
      expect(pot.all_in_cap).to eq(500)
    end

    it "returns correct surplus if all_in cap is not zero" do
      pot.add_bet(all_in_player, 500)
      surplus = pot.add_bet(not_all_in_player, 700)
      expect(surplus[not_all_in_player]).to eq(200)
    end
  end

  describe "#players_called_cap?" do
    it "returns if all players called to all-in cap" do
      pot.add_bet(all_in_player, 500)
      pot.add_bet(not_all_in_player, 500)
      expect(pot.players_called_cap?).to be_true
    end
  end

  describe "#player_called?" do
    it "returns if player called to max bet" do
      expect(pot.player_called?(not_all_in_player)).to be_true
    end
  end

  describe "#amount" do
    it "returns the amount of pot" do
      pot.add_bet(all_in_player, 500)
      pot.add_bet(not_all_in_player, 500)
      expect(pot.amount).to eq(1000)
    end
  end
end