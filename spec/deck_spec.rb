require 'deck'

describe Deck do
  let(:deck) { Deck.new }

  describe "#shuffle" do
    it "returns full deck" do
      expect(deck.size).to eq(52)
    end

    it "refills the deck" do
      5.times { deck.draw }
      expect(deck.shuffle.size).to eq(52)
    end
  end

  describe "#draw" do
    it "returns a card" do
      expect(deck.draw).to be_a(Card)
    end

    it "removes card from the deck" do
      deck.draw
      expect(deck.size).to eq(51)
    end
  end

end
