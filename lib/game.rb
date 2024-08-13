require_relative "board"
require_relative "player_1"
require_relative "player_2"
require "colorize"
# game loop
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def start # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    @board = Board.new
    @board.display
    infinite = 0
    until infinite == 1

      if @turn.even?
        puts "#{@player1.name} where do you want to play? (enter 1-9)"
        place = gets.chomp.to_i
        @turn -= 1 if @board.place_symbol(@player1, place) == false
        result = @board.winner?(@player1, @board.place_to_coordinate(place))

        if result == true
          puts "#{@player1.name} WINS!!".colorize(:green)
          @board.display
          @player1.score += 1
          break
        elsif result == :tie
          puts "The game ended in a tie!".colorize(:yellow)
          @board.display
          break
        end
      else
        puts "#{@player2.name} where do you want to play? (enter 1-9)"
        place = gets.chomp.to_i
        @turn -= 1 if @board.place_symbol(@player2, place) == false
        result = @board.winner?(@player2, @board.place_to_coordinate(place))

        if result == true
          puts "#{@player2.name} WINS!!".colorize(:green)
          @board.display
          @player2.score += 1
          break
        elsif result == :tie
          puts "The game ended in a tie!".colorize(:yellow)
          @board.display
          break
        end
      end

      @board.display
      @turn += 1
    end
  end
end
