# player 2
class Player2
  attr_accessor :score, :symbol, :name, :color

  def initialize(name)
    @name = name
    @score = 0
    @symbol = "O"
    @color = :yellow
  end
end
