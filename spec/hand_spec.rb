require 'hand'

describe Hand do
  let(:hand) {Hand.new}

  it "starts empty" do
    expect(hand.card_count).to eq(0)
  end

  it "recieves cards" do
    hand.add_card(double)
    expect(hand.card_count).to eq(1)
  end

  it "can empty itself" do
    5.times { hand.add_card(double) }
    hand.empty
    expect(hand.card_count).to eq(0)
  end

  it "can drop a card" do
    5.times { hand.add_card(double) }
    hand.drop_card(3)
    expect(hand.card_count).to eq(4)
  end

  it "can score itself" do
    c1 = double(:suit => :H, :value => 7)
    c2 = double(:suit => :H, :value => 9)
    c3 = double(:suit => :H, :value => 10)
    c4 = double(:suit => :H, :value => 11)
    c5 = double(:suit => :H, :value => 12)
    hand.add_card(c1)
    hand.add_card(c2)
    hand.add_card(c3)
    hand.add_card(c4)
    hand.add_card(c5)
    expect(hand.get_score).to eq(29) #flush
  end

  it "can score a high card" do
    c1 = double(:suit => :H, :value => 7)
    c2 = double(:suit => :D, :value => 9)
    c3 = double(:suit => :S, :value => 10)
    c4 = double(:suit => :C, :value => 11)
    c5 = double(:suit => :H, :value => 12)
    hand.add_card(c1)
    hand.add_card(c2)
    hand.add_card(c3)
    hand.add_card(c4)
    hand.add_card(c5)
    expect(hand.get_score).to eq(-2)
  end

  # if all passed
  #   puts "holy shit that's so #tight"
  # end
end
