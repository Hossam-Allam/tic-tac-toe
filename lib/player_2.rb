# player 2
class Player2
  attr_accessor :score, :symbol, :name

  def initialize(name)
    @name = name
    @score = 0
    @symbol = "O"
  end
end
