require_relative "lib/game"
require_relative "lib/player_1"
require_relative "lib/player_2"
require "colorize"
puts "Welcome to tic tac toe"

puts "player X enter your name"

name_1 = gets.chomp # rubocop:disable Naming/VariableNumber

x = Player1.new(name_1)

puts "player O enter your name"

name_2 = gets.chomp # rubocop:disable Naming/VariableNumber

o = Player2.new(name_2)

loop do
  game = Game.new(x, o)

  game.start

  puts "#{x.name} score: #{x.score}".colorize(:blue)
  puts "#{o.name} score: #{o.score}".colorize(:blue)
  puts "Do you want to play again? (Y/y)"

  answer = gets.chomp.downcase

  break unless answer == "y"
end

puts "Hope you had fun"
