require 'spec_helper'
 
describe Card do
  let(:card) { Card.new(5, 3) }
  let(:same_card) { Card.new(5, 3) }
  let(:other_card) { Card.new(6, 3) }

  describe "#rank" do
    it "returns the correct rank" do
      expect(card.rank).to eq(5)
    end
  end

  describe "#suit" do
    it "returns the correct suit" do
      expect(card.suit).to eq(3)
    end
  end

  describe "#==" do
    it "returns true if two cards are equal" do
      expect(card == same_card).to be true
    end
  end

  describe "#==" do
    it "returns false if two cards are different" do
      expect(card == other_card).to be false
    end
  end

  describe "#to_s" do
    it "returns the correct string" do
      expect(card.to_s).to eq("5, Hearts")
    end
  end
end