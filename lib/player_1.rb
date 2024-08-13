# player 1
class Player1
  attr_accessor :score, :symbol, :name

  def initialize(name)
    @name = name
    @score = 0
    @symbol = "X"
  end
end
