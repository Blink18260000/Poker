require 'card'

describe Card do
  let(:card) { Card.new(:H, 2) }

  it "returns suit" do
    expect(card.suit).to eq(:H)
  end

  it "returns value" do
    expect(card.value).to eq(2)
  end

  it "returns a good looking card" do
    expect(card.to_s).to eq(" #{"\u2665".encode("utf-8")} 2 ".colorize(:color => :red, :background => :white))
  end
end
