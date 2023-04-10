require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


game = Game.new


puts game.menu


puts game.computer_ship_placement
puts game.board.render(true)