require 'spec_helper'
 
describe Card do
  before :each do
    @card = Card.new 5, 3
  end

  describe "#new" do
    it "takes two parameters and returns a Card object" do
      @card.should be_an_instance_of Card
    end
  end

  describe "#rank" do
    it "returns the correct rank" do
      @card.rank.should eql 5
    end
  end

  describe "#suit" do
    it "returns the correct suit" do
      @card.suit.should eql 3
    end
  end

  describe "#to_s" do
    it "returns the correct string" do
      @card.to_s.should eql "5, Hearts"
    end
  end
end