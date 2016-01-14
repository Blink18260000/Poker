require 'player'

describe Player do
  let(:player) { Player.new }

  describe "#recieve_card" do
    it "recieves a card, and puts the card in its hand" do
      new_card = instance_double("Card", :suit => :S, :value => 14)
      player.recieve_card(new_card)
      expect(player.hand_size).to eq(1)
    end
  end

  describe "#discard" do
    it "drops card at an index" do

    end
  end

  describe "#bet" do
    it "can choose to see, raise, or fold" do

    end

    it "returns raise_value with raise" do

    end
  end

end
