require_relative 'hand'

class Player

  attr_reader :name

  def initialize(name = "Jeff", wallet = 10)
    @name = name
    @wallet = wallet
    @poker_hand = Hand.new
  end

  def recieve_card(some_card)
    @poker_hand.add_card(some_card)
    self
  end

  def hand_size
    @poker_hand.card_count
  end

  def drop_cards
    count = 0
    card_to_drop = "1"
    p card_to_drop
    p (["1", "2", "3", "4", "5"].include?(card_to_drop))
    until !(["1", "2", "3", "4", "5"].include?(card_to_drop)) || count == 3
      card_to_drop = gets.chomp
      count += 1
      @poker_hand.drop_card(card_to_drop.to_i)
      system("clear")
      puts self.to_s
    end
    count
  end

  def to_s
    "Name: #{@name}       Wallet: #{@wallet}\n" + @poker_hand.to_s
  end

  def bet

  end

end
