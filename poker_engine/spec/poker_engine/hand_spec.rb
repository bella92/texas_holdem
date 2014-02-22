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
      expect(hand.find_best_hand).to eq(RoyalFlush)
    end

    it "finds straight flush" do
      cards = [Card.new(9, 3), Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(StraightFlush)
    end

    it "finds four of a kind" do
      cards = [Card.new(9, 1), Card.new(9, 2), Card.new(9, 3), Card.new(9, 4), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(FourOfaKind)
      expect(hand.find_kickers). to eq([14])
    end

    it "finds full house" do
      cards = [Card.new(9, 1), Card.new(9, 2), Card.new(13, 3), Card.new(13, 4), Card.new(13, 2), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(FullHouse)
    end

    it "finds flush" do
      cards = [Card.new(9, 3), Card.new(10, 3), Card.new(11, 3), Card.new(12, 3), Card.new(3, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(Flush)
    end

    it "finds straight" do
      cards = [Card.new(14, 3), Card.new(2, 3), Card.new(3, 1), Card.new(4, 2), Card.new(5, 3), Card.new(11, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(Straight)
    end

    it "finds three of a kind" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(9, 1), Card.new(12, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(ThreeOfaKind)
      expect(hand.find_kickers). to eq([14, 13])
    end

    it "finds two pairs" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(12, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(TwoPairs)
      expect(hand.find_kickers). to eq([14])
    end

    it "finds pair" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(Pair)
      expect(hand.find_kickers). to eq([14, 13, 12])
    end

    it "finds high card" do
      cards = [Card.new(8, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand.find_best_hand).to eq(HighCard)
      expect(hand.find_kickers). to eq([13, 12, 9, 8])
    end
  end

  describe "#<=>" do
    it "compares hands by hand" do
      straight_cards = [Card.new(14, 3), Card.new(2, 3), Card.new(3, 1), Card.new(4, 2), Card.new(5, 3), Card.new(11, 3), Card.new(14, 1)]
      pair_cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      straight_hand = Hand.new(straight_cards)
      pair_hand = Hand.new(pair_cards)
      expect(straight_hand <=> pair_hand).to eq(1)
    end

    it "compares hands by high cards" do
      straight_cards = [Card.new(14, 3), Card.new(2, 3), Card.new(3, 1), Card.new(4, 2), Card.new(5, 3), Card.new(11, 3), Card.new(14, 1)]
      greater_straight_cards = [Card.new(2, 3), Card.new(3, 1), Card.new(4, 2), Card.new(5, 3), Card.new(6, 3), Card.new(14, 1), Card.new(5, 2)]
      straight_hand = Hand.new(straight_cards)
      greater_straight_hand = Hand.new(greater_straight_cards)
      expect(straight_hand <=> greater_straight_hand).to eq(-1)
    end

    it "compares hands by kickers" do
      pair_cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      greater_pair_cards = [Card.new(10, 3), Card.new(10, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      pair_hand = Hand.new(pair_cards)
      greater_pair_hand = Hand.new(greater_pair_cards)
      expect(pair_hand <=> greater_pair_hand).to eq(-1)
    end

    it "compares equal hands" do
      cards = [Card.new(9, 3), Card.new(9, 4), Card.new(12, 1), Card.new(3, 2), Card.new(13, 3), Card.new(2, 3), Card.new(14, 1)]
      hand = Hand.new(cards)
      expect(hand <=> hand).to eq(0)
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