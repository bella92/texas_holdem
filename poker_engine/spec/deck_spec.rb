require 'spec_helper'

describe Deck do
  let(:deck) { Deck.new }

  #TODO: fix this
  describe "#new" do
    it "sets the correct cards" do
      cards = ["2, Clubs", "2, Diamonds", "2, Hearts", "2, Spades", "3, Clubs", "3, Diamonds", "3, Hearts", "3, Spades",
               "4, Clubs", "4, Diamonds", "4, Hearts", "4, Spades", "5, Clubs", "5, Diamonds", "5, Hearts", "5, Spades",
               "6, Clubs", "6, Diamonds", "6, Hearts", "6, Spades", "7, Clubs", "7, Diamonds", "7, Hearts", "7, Spades",
               "8, Clubs", "8, Diamonds", "8, Hearts", "8, Spades", "9, Clubs", "9, Diamonds", "9, Hearts", "9, Spades",
               "10, Clubs", "10, Diamonds", "10, Hearts", "10, Spades", "J, Clubs", "J, Diamonds", "J, Hearts", "J, Spades",
               "Q, Clubs", "Q, Diamonds", "Q, Hearts", "Q, Spades", "K, Clubs", "K, Diamonds", "K, Hearts", "K, Spades",
               "A, Clubs", "A, Diamonds", "A, Hearts", "A, Spades"]
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