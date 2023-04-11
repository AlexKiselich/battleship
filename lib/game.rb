class Game
  attr_reader :board

  def initialize
    @computer_player = Player.new
    @player = Player.new
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  def menu
    puts "Hello!"
    puts "What is your name?"
    name = gets.chomp
    puts "Hello #{name}, Welcome to Battleship"
    puts "Please enter 'p' to play a game or 'q' to quit"
    input = gets.chomp
      if input == "p" 
        puts "Play game!"
          elsif input == "q"
          puts "See you next time!"
        else
         puts "Invalid, please try again!"
          menu
        end
  end
  # We want to create loops for both ships with keys.sample and 
  # compare that to our method 'proper placement'.
  def computer_ship_placement
    new_coords = []
    new_coords << @board.cells.keys.sample(3)
    board.place(@cruiser, ["A1", "A2", "A3"])
    # board.place(@submarine, ["B1", "B2"])
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."
    require 'pry'; binding.pry
  end
end
# require 'pry'; binding.pry