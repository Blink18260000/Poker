require 'colorize'

class Card

  IMAGE = {
    S14: " #{"\u2660".encode("utf-8")} A ".colorize(:color => :black, :background => :white),
    S2: " #{"\u2660".encode("utf-8")} 2 ".colorize(:color => :black, :background => :white),
    S3: " #{"\u2660".encode("utf-8")} 3 ".colorize(:color => :black, :background => :white),
    S4: " #{"\u2660".encode("utf-8")} 4 ".colorize(:color => :black, :background => :white),
    S5: " #{"\u2660".encode("utf-8")} 5 ".colorize(:color => :black, :background => :white),
    S6: " #{"\u2660".encode("utf-8")} 6 ".colorize(:color => :black, :background => :white),
    S7: " #{"\u2660".encode("utf-8")} 7 ".colorize(:color => :black, :background => :white),
    S8: " #{"\u2660".encode("utf-8")} 8 ".colorize(:color => :black, :background => :white),
    S9: " #{"\u2660".encode("utf-8")} 9 ".colorize(:color => :black, :background => :white),
    S10: " #{"\u2660".encode("utf-8")}10 ".colorize(:color => :black, :background => :white),
    S11: " #{"\u2660".encode("utf-8")} J ".colorize(:color => :black, :background => :white),
    S12: " #{"\u2660".encode("utf-8")} Q ".colorize(:color => :black, :background => :white),
    S13: " #{"\u2660".encode("utf-8")} K ".colorize(:color => :black, :background => :white),

    C14: " #{"\u2663".encode("utf-8")} A ".colorize(:color => :black, :background => :white),
    C2: " #{"\u2663".encode("utf-8")} 2 ".colorize(:color => :black, :background => :white),
    C3: " #{"\u2663".encode("utf-8")} 3 ".colorize(:color => :black, :background => :white),
    C4: " #{"\u2663".encode("utf-8")} 4 ".colorize(:color => :black, :background => :white),
    C5: " #{"\u2663".encode("utf-8")} 5 ".colorize(:color => :black, :background => :white),
    C6: " #{"\u2663".encode("utf-8")} 6 ".colorize(:color => :black, :background => :white),
    C7: " #{"\u2663".encode("utf-8")} 7 ".colorize(:color => :black, :background => :white),
    C8: " #{"\u2663".encode("utf-8")} 8 ".colorize(:color => :black, :background => :white),
    C9: " #{"\u2663".encode("utf-8")} 9 ".colorize(:color => :black, :background => :white),
    C10: " #{"\u2663".encode("utf-8")}10 ".colorize(:color => :black, :background => :white),
    C11: " #{"\u2663".encode("utf-8")} J ".colorize(:color => :black, :background => :white),
    C12: " #{"\u2663".encode("utf-8")} Q ".colorize(:color => :black, :background => :white),
    C13: " #{"\u2663".encode("utf-8")} K ".colorize(:color => :black, :background => :white),

    H14: " #{"\u2665".encode("utf-8")} A ".colorize(:color => :red, :background => :white),
    H2: " #{"\u2665".encode("utf-8")} 2 ".colorize(:color => :red, :background => :white),
    H3: " #{"\u2665".encode("utf-8")} 3 ".colorize(:color => :red, :background => :white),
    H4: " #{"\u2665".encode("utf-8")} 4 ".colorize(:color => :red, :background => :white),
    H5: " #{"\u2665".encode("utf-8")} 5 ".colorize(:color => :red, :background => :white),
    H6: " #{"\u2665".encode("utf-8")} 6 ".colorize(:color => :red, :background => :white),
    H7: " #{"\u2665".encode("utf-8")} 7 ".colorize(:color => :red, :background => :white),
    H8: " #{"\u2665".encode("utf-8")} 8 ".colorize(:color => :red, :background => :white),
    H9: " #{"\u2665".encode("utf-8")} 9 ".colorize(:color => :red, :background => :white),
    H10: " #{"\u2665".encode("utf-8")}10 ".colorize(:color => :red, :background => :white),
    H11: " #{"\u2665".encode("utf-8")} J ".colorize(:color => :red, :background => :white),
    H12: " #{"\u2665".encode("utf-8")} Q ".colorize(:color => :red, :background => :white),
    H13: " #{"\u2665".encode("utf-8")} K ".colorize(:color => :red, :background => :white),

    D14: " #{"\u2666".encode("utf-8")} A ".colorize(:color => :red, :background => :white),
    D2: " #{"\u2666".encode("utf-8")} 2 ".colorize(:color => :red, :background => :white),
    D3: " #{"\u2666".encode("utf-8")} 3 ".colorize(:color => :red, :background => :white),
    D4: " #{"\u2666".encode("utf-8")} 4 ".colorize(:color => :red, :background => :white),
    D5: " #{"\u2666".encode("utf-8")} 5 ".colorize(:color => :red, :background => :white),
    D6: " #{"\u2666".encode("utf-8")} 6 ".colorize(:color => :red, :background => :white),
    D7: " #{"\u2666".encode("utf-8")} 7 ".colorize(:color => :red, :background => :white),
    D8: " #{"\u2666".encode("utf-8")} 8 ".colorize(:color => :red, :background => :white),
    D9: " #{"\u2666".encode("utf-8")} 9 ".colorize(:color => :red, :background => :white),
    D10: " #{"\u2666".encode("utf-8")}10 ".colorize(:color => :red, :background => :white),
    D11: " #{"\u2666".encode("utf-8")} J ".colorize(:color => :red, :background => :white),
    D12: " #{"\u2666".encode("utf-8")} Q ".colorize(:color => :red, :background => :white),
    D13: " #{"\u2666".encode("utf-8")} K ".colorize(:color => :red, :background => :white),
  }

  attr_reader :suit, :value

  #Suits: :H, :S, :D, :C
  #Values: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 (Jack), 12 (Queen), 13 (King), 14 (Ace)
  def initialize(suit, value)
    @suit = suit
    @value = value
    @hash_val = ((suit.to_s).concat(value.to_s)).to_sym
  end

  def to_s
    IMAGE[@hash_val]
  end

end

#puts "#{c.to_s} #{c2.to_s} #{c3.to_s} #{c4.to_s} #{c5.to_s}" -- Happens in hand.to_s

# Comparing for strongest hand wins the pot; add at end
  # def <=>(arg1)
  #   raise "Invalid comparison: not a card" unless arg1.is_a?(Card)
  #
  # end
