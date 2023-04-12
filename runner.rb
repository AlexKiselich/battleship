require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


game = Game.new


game.menu


game.comp_ship_placement
game.player_cruiser_placement
game.player_submarine_placement
# puts game.comp_board.render
# puts game.comp_board.render(true)
# puts game.player_board.render(true)
game.turn