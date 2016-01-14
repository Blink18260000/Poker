require_relative 'player'
require_relative 'deck'

class Game

  def initialize
    @player = Player.new
    @deck = Deck.new
    @player.recieve_card(@deck.draw) until @player.hand_size == 5
    puts @player.to_s
    @player.drop_cards
    puts @player.to_s
  end



end

the_game = Game.new
