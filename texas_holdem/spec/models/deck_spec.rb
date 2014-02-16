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
      @deck.cards.should eql ["2, Spades",
"2, Hearts",
"2, Diamonds",
"2, Clubs",
"3, Spades",
"3, Hearts",
"3, Diamonds",
"3, Clubs",
"4, Spades",
"4, Hearts",
"4, Diamonds",
"4, Clubs",
"5, Spades",
"5, Hearts",
"5, Diamonds",
"5, Clubs",
"6, Spades",
"6, Hearts",
"6, Diamonds",
"6, Clubs",
"7, Spades",
"7, Hearts",
"7, Diamonds",
"7, Clubs",
"8, Spades",
"8, Hearts",
"8, Diamonds",
"8, Clubs",
"9, Spades",
"9, Hearts",
"9, Diamonds",
"9, Clubs",
"10, Spades",
"10, Hearts",
"10, Diamonds",
"10, Clubs",
"J, Spades",
"J, Hearts",
"J, Diamonds",
"J, Clubs",
"Q, Spades",
"Q, Hearts",
"Q, Diamonds",
"Q, Clubs",
"K, Spades",
"K, Hearts",
"K, Diamonds",
"K, Clubs",
"A, Spades",
"A, Hearts",
"A, Diamonds",
"A, Clubs"]
    end
  end
end