require_relative '../../lib/poker_engine.rb'
 
describe Pots do
  let(:pots) { Pots.new }
  let(:all_in_player) { Player.new("All-in player", true) }
  let(:not_all_in_player) { Player.new("Not all-in player", false) }
  let(:winners) { [Player.new("My winner", false)] }

  describe "#new" do
    it "sets pots with one pot" do
      expect(pots.pots).to include(be_a Pot)
    end
  end

  describe "#add_bet" do
    it "adds bet to first pot if surplus is zero" do
      pots.add_bet(not_all_in_player, 700)
      expect(pots.pots.first.amount).to eq(700)
    end

    it "adds bet to next pot if surplus isn't zero" do
      pots.add_bet(all_in_player, 500)
      pots.add_bet(not_all_in_player, 700)
      expect(pots.pots.at(1).amount).to eq(200)
    end
  end

  describe "#pay_winners" do
    it "increases winner's bankroll with correct amount" do
      pots.add_bet(not_all_in_player, 500)
      pots.pay_winners(winners)
      expect(winners.first.bankroll).to eq(1500)
    end
  end
end 