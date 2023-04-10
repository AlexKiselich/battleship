class Game
  attr_reader :board
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def menu
    puts "Hello!"
    puts "What is your name?"
    name = gets.chomp
    puts "Hello #{name}, Welcome to Battleship"
    puts "Please enter p to play a game or q to quit"
    input = gets.chomp
      if input == "p" 
        puts "play game"
          elsif input == "q"
          puts "See you next time"
        else
         puts "invalid, please try again"
          menu
        end
  end
  
  def computer_ship_placement
    new_cords = []

    new_cords << @board.cells.keys.sample(3)
    board.place(@cruiser, ["A1", "A2", "A3"])
    # board.place(@submarine, ["B1", "B2"])
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."
    require 'pry'; binding.pry
  end
end
# require 'pry'; binding.pry