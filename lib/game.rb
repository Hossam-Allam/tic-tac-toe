require_relative "board"
require_relative "player_1"
require_relative "player_2"

# game loop
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def start
    @board = Board.new
    @board.display

    until @board.winner?

      if @turn.even?
        puts "#{@player1.name} where do you want to play? (enter 1-9)"
        place = gets.chomp.to_i
        @turn -= 1 if @board.place_symbol(@player1, place) == false
      else
        puts "#{@player2.name} where do you want to play? (enter 1-9)"
        place = gets.chomp.to_i
        @turn -= 1 if @board.place_symbol(@player2, place) == false
      end

      @board.display
      @turn += 1
    end
  end
end
