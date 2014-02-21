require_relative '../../lib/poker_engine.rb'
 
describe Hand do

  describe "#new" do
    it "sets correct cards" do
      cards = [Card.new(2, 3), Card.new(3, 3), Card.new(4, 1), Card.new(4, 3), Card.new(9, 2), Card.new(10, 3), Card.new(10, 2)]
      hand = Hand.new(cards)
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#find_best_hand" do
    it "finds royal flush" do
      cards = [Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(13, 3), Card.new(14, 3), Card.new(2, 3), Card.new(13, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(10)
    end

    it "finds straight flush" do
      cards = [Card.new(9, 3), Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(9)
    end

    it "finds four of a kind" do
      cards = [Card.new(9, 1), Card.new(9, 2), Card.new(9, 3), Card.new(9, 4), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(8)
      expect(hand.find_kickers). to eq([0])
    end

    it "finds full house" do
      cards = [Card.new(9, 1), Card.new(9, 2), Card.new(13, 3), Card.new(13, 4), Card.new(13, 2), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(7)
    end

    it "finds flush" do
      cards = [Card.new(9, 3), Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(3, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(6)
    end

    it "finds straight" do
      cards = [Card.new(14, 3), Card.new(2, 3), Card.new(3, 1), Card.new(4, 2), Card.new(5, 3), Card.new(11, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(5)
    end

    it "finds three of a kind" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(9, 1), Card.new(12, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(4)
      expect(hand.find_kickers). to eq([0, 1])
    end

    it "finds two pairs" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(12, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(3)
      expect(hand.find_kickers). to eq([0])
    end

    it "finds pair" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(2)
      expect(hand.find_kickers). to eq([0, 1, 2])
    end

    it "finds high card" do
      cards = [Card.new(8, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(1)
      expect(hand.find_kickers). to eq([1, 2, 5, 6])
    end
  end

  describe "#suit_count" do
    it "returns string with cards count for each suit" do
      cards = [Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(13, 3), Card.new(14, 1), Card.new(2, 3), Card.new(13, 1)]
      hand = Hand.new(cards)
      expect(hand.suit_count).to eq("0502")
    end
  end

  describe "#rank_count" do
    it "returns string with cards count for each rank" do
      cards = [Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(13, 3), Card.new(14, 1), Card.new(2, 3), Card.new(13, 1)]
      hand = Hand.new(cards)
      expect(hand.rank_count).to eq("1211100000001")
    end
  end
end