require_relative '../../lib/poker_engine.rb'

describe Dealer do
  let(:dealer) { Dealer.new }
  let(:table) { Table.new }
  let(:first_player) { Player.new("First player") }
  let(:second_player) { Player.new("Second player") }

  describe "#new" do
    it "sets a deck" do
      expect(dealer.deck.cards.count).to eq(52)
    end
  end

  describe "#shuffle_deck" do
    it "shuffles the deck" do
      ordered_deck = dealer.deck
      dealer.shuffle_deck
      expect(dealer.deck).to eq(ordered_deck)
    end
  end

  describe "#deal_preflop" do
    it "deals two cards to each player one by one" do
      table.add_player(first_player)
      table.add_player(second_player)
      dealer.deal_preflop(table)
      expect(table.players[0].pocket.map { |card| card.suit }).to match_array([4, 2])
      expect(table.players[1].pocket.map { |card| card.suit }).to match_array([3, 1])
    end
  end

  describe "#deal_to_board" do
    it "deals count cards to board skipping one" do
      dealer.deal_to_board(table, 3)
      expect(table.board.map { |card| card.suit }).to match_array([3, 2, 1])
    end
  end
end