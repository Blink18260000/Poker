require_relative 'card'

class Deck

  def initialize
    #@cards_list = []
    shuffle
  end

  def shuffle
    @cards_list = []
    suits = [:S, :H, :D, :C]

    suits.each do |suit|
      count = 2
      until count > 14
        @cards_list << Card.new(suit, count)
        count += 1
      end
    end

    @cards_list.shuffle!
    self
  end

  def draw
    @cards_list.pop
  end

  def size
    @cards_list.size
  end

  def cheat
    @cards_list.push(Card.new(:S, 14))
    return "Nothing to see here, carry on."
  end

end
