require_relative "lib/game"
require_relative "lib/player_1"
require_relative "lib/player_2"

puts "Welcome to tic tac toe"

puts "player X enter your name"

name_1 = gets.chomp # rubocop:disable Naming/VariableNumber

x = Player1.new(name_1)

puts "player O enter your name"

name_2 = gets.chomp # rubocop:disable Naming/VariableNumber

o = Player2.new(name_2)

game = Game.new(x, o)

game.start
