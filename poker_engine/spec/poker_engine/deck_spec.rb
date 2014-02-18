require_relative '../../lib/poker_engine.rb'

describe Deck do
  let(:deck) { Deck.new }

  #TODO: fix this
  describe "#new" do
    it "sets the correct cards" do
      cards = ["2 of Clubs", "2 of Diamonds", "2 of Hearts", "2 of Spades", "3 of Clubs", "3 of Diamonds", "3 of Hearts", "3 of Spades",
               "4 of Clubs", "4 of Diamonds", "4 of Hearts", "4 of Spades", "5 of Clubs", "5 of Diamonds", "5 of Hearts", "5 of Spades",
               "6 of Clubs", "6 of Diamonds", "6 of Hearts", "6 of Spades", "7 of Clubs", "7 of Diamonds", "7 of Hearts", "7 of Spades",
               "8 of Clubs", "8 of Diamonds", "8 of Hearts", "8 of Spades", "9 of Clubs", "9 of Diamonds", "9 of Hearts", "9 of Spades",
               "10 of Clubs", "10 of Diamonds", "10 of Hearts", "10 of Spades", "J of Clubs", "J of Diamonds", "J of Hearts", "J of Spades",
               "Q of Clubs", "Q of Diamonds", "Q of Hearts", "Q of Spades", "K of Clubs", "K of Diamonds", "K of Hearts", "K of Spades",
               "A of Clubs", "A of Diamonds", "A of Hearts", "A of Spades"]
      expect(deck.cards.map { |card| card.to_s }).to match_array(cards)
    end

    it "sets shuffled cards" do
      cards = deck.cards
      expect(deck.cards.sort).to_not equal(cards)
    end
  end

  describe "#take_cards" do
    it "returns the correct array of taken cards" do
      last_cards = deck.cards.last(2)
      taken_cards = deck.take_cards(2)
      expect(taken_cards).to eq(last_cards)
    end

    it "skips the correct number of cards" do
      taken_cards = deck.take_cards(2, skip: 1)
      expect(taken_cards).to_not include(deck.cards.last)
    end
  end
end