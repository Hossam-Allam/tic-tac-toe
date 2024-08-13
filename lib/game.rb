require_relative "board"
require_relative "player_1"
require_relative "player_2"

# game loop
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    @board = Board.new
    @board.display
  end
end
