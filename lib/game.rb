class Game

  attr_reader :board,
              :comp_cruiser,
              :comp_submarine

  def initialize
    @comp_player = Player.new
    @player = Player.new
    @comp_board = Board.new
    @player_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
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
    comp_cruz_placement
    comp_sub_placement
   
      puts "I have laid out my ships on the grid.
      You now need to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long."
    end


    def comp_sub_placement
      valid_sub_cords = comp_board.cells.keys.sample(2)
      until comp_board.valid_placement?(comp_submarine, valid_sub_cords) == true
        valid_sub_cords = comp_board.cells.keys.sample(2)
      end
      comp_board.place(comp_submarine, valid_sub_cords)
    end

    def comp_cruz_placement
      valid_cruz_cords = comp_board.cells.keys.sample(3)
      until comp_board.valid_placement?(comp_cruiser, valid_cruz_cords) == true
        valid_cruz_cords = comp_board.cells.keys.sample(3)
      end
      comp_board.place(comp_cruiser, valid_cruz_cords)
    end
  end
  # require 'pry'; binding.pry