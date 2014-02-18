require_relative '../../lib/poker_engine.rb'
 
describe Player do
  let(:table) { Table.new }
  let(:player) { Player.new("My player") }
  let(:first_card) { Card.new(10, 4) }
  let(:second_card) { Card.new(13, 2) }

  describe "#new" do
    it "sets an empty players" do
      expect(table.players).to be_empty
    end

    it "sets an empty board" do
      expect(table.board).to be_empty
    end

    it "sets the default pot" do
      expect(table.pot).to eq(0)
    end
  end

  describe "#add_player" do
    it "adds player to players" do
      table.add_player(player)
      expect(table.players).to include(player)
    end
  end

  describe "#remove_player" do
    it "removes player from players" do
      table.remove_player(player)
      expect(table.players).to_not include(player)
    end
  end

  describe "#add_cards_to_board" do
    it "adds cards to board" do
      cards = [first_card, second_card]
      table.add_cards_to_board(cards)
      expect(table.board).to include(first_card, second_card)
    end
  end

  describe "#clear_board" do
    it "clears the board" do
      table.clear_board
      expect(table.board).to be_empty
    end
  end

  describe "#increase_pot" do
    it "increases the pot" do
      table.increase_pot(500)
      expect(table.pot).to eq(500)
    end
  end

  describe "#clear_pot" do
    it "clears the pot" do
      table.clear_pot
      expect(table.pot).to eq(0)
    end
  end
end