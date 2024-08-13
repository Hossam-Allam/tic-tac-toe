require "colorize"
# game board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, "_") }
  end

  def display
    @board.each do |row|
      puts row.join(" ")
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity,Lint/MissingCopEnableDirective
  def place_to_coordinate(place) # rubocop:disable Metrics/MethodLength
    case place
    when 1
      [0, 0]
    when 2
      [0, 1]
    when 3
      [0, 2]
    when 4
      [1, 0]
    when 5
      [1, 1]
    when 6
      [1, 2]
    when 7
      [2, 0]
    when 8
      [2, 1]
    when 9
      [2, 2]
    else
      [nil, nil] # in case of invalid input
    end
  end

  def place_symbol(player, place)
    coordinates = place_to_coordinate(place)

    return unless coordinates.all? { |coord| !coord.nil? }

    if (@board[coordinates[0]][coordinates[1]] == "_") # rubocop:disable Style/ParenthesesAroundCondition
      colored_symbol = case player
                       when Player1
                         player.symbol.colorize(:blue)
                       when Player2
                         player.symbol.colorize(:yellow)
                       end
      @board[coordinates[0]][coordinates[1]] = colored_symbol
    else
      puts "place is already occupied".colorize(:red)
      false
    end
  end

  def winner?(player, coordinates)
    row, col = coordinates

    # Check the row
    return true if @board[row].all? { |value| value == player.symbol }

    # Check the column
    return true if @board.all? { |r| r[col] == player.symbol }

    # Check the diagonal (top-left to bottom-right)
    return true if row == col && (0..2).all? { |i| @board[i][i] == player.symbol }

    # Check the anti-diagonal (top-right to bottom-left)
    return true if row + col == 2 && (0..2).all? { |i| @board[i][2 - i] == player.symbol }

    false
  end
end
