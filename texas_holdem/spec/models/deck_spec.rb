require 'spec_helper'
 
describe Deck do
  before :each do
    @deck = Deck.new
  end

  describe "#new" do
    it "takes no parameters and returns a Deck object" do
      @deck.should be_an_instance_of Deck
    end
  end

  describe "#cards" do
    it "returns the correct array of cards" do
      @deck.cards.map { |card| card.to_s }.should eql ["2, Clubs",
                                   "2, Diamonds",
                                   "2, Hearts",
                                   "2, Spades",
                                   "3, Clubs",
                                   "3, Diamonds",
                                   "3, Hearts",
                                   "3, Spades",
                                   "4, Clubs",
                                   "4, Diamonds",
                                   "4, Hearts",
                                   "4, Spades",
                                   "5, Clubs",
                                   "5, Diamonds",
                                   "5, Hearts",
                                   "5, Spades",
                                   "6, Clubs",
                                   "6, Diamonds",
                                   "6, Hearts",
                                   "6, Spades",
                                   "7, Clubs",
                                   "7, Diamonds",
                                   "7, Hearts",
                                   "7, Spades",
                                   "8, Clubs",
                                   "8, Diamonds",
                                   "8, Hearts",
                                   "8, Spades",
                                   "9, Clubs",
                                   "9, Diamonds",
                                   "9, Hearts",
                                   "9, Spades",
                                   "10, Clubs",
                                   "10, Diamonds",
                                   "10, Hearts",
                                   "10, Spades",
                                   "J, Clubs",
                                   "J, Diamonds",
                                   "J, Hearts",
                                   "J, Spades",
                                   "Q, Clubs",
                                   "Q, Diamonds",
                                   "Q, Hearts",
                                   "Q, Spades",
                                   "K, Clubs",
                                   "K, Diamonds",
                                   "K, Hearts",
                                   "K, Spades",
                                   "A, Clubs",
                                   "A, Diamonds",
                                   "A, Hearts",
                                   "A, Spades"]
    end
  end
end