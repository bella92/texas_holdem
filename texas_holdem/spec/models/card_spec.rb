require 'spec_helper'
 
describe Card do
  let(:card) { Card.new(5, 3) }
  let(:equal_card) { Card.new(5, 3) }
  let(:greater_card) { Card.new(6, 3) }

  describe "#new" do
    it "sets the correct rank" do
      expect(card.rank).to eq(5)
    end

    it "sets the correct suit" do
      expect(card.suit).to eq(3)
    end
  end

  describe "#<=>" do
    it "returns -1 if first card is less than second" do
      expect(card <=> greater_card).to eq(-1)
    end
  end

  describe "#<=>" do
    it "returns 1 if first card is greater than second" do
      expect(greater_card <=> card).to eq(1)
    end
  end

  describe "#<=>" do
    it "returns 0 if two cards are equal" do
      expect(card <=> equal_card).to eq(0)
    end
  end

  describe "#to_s" do
    it "returns the correct string" do
      expect(card.to_s).to eq("5, Hearts")
    end
  end
end