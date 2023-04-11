require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


game = Game.new


puts game.menu


game.computer_ship_placement
puts game.comp_board.render
require 'pry'; binding.pry
puts game.comp_board.render(true)