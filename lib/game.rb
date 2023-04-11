class Game

  attr_reader :comp_board,
              :comp_cruiser,
              :comp_submarine,
              :player_board,
              :player_cruiser,
              :player_submarine

  def initialize
    # @comp_player = Player.new
    # @player = Player.new
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
  def comp_ship_placement
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

    def player_cruiser_placement
      puts "Enter the squares for the Cruiser (3 spaces):"
        player_cruiser_input = gets.chomp.upcase.split
        if player_board.valid_placement?(@player_cruiser, player_cruiser_input) == true
        end
      player_board.place(@player_cruiser, player_cruiser_input)
    end

    def player_submarine_placement
      # require ‘pry’; binding.pry
      puts "Enter the squares for the Submarine (2 spaces):"
      player_submarine_input = gets.chomp.upcase.split
      if player_board.valid_placement?(@player_submarine, player_submarine_input) == false
        puts "Those are invalid coordinates. Please try again:"
        player_submarine_placement
      else
        player_board.place(@player_submarine, player_submarine_input)
      end
    end

    def turn
      puts comp_board.render
      puts player_board.render#(true)
      puts 'Enter the coordinate for your shot:'
      cell = gets.chomp.upcase
      comp_board.cells[cell].fire_upon
      require 'pry'; binding.pry
    end

  end
  # require 'pry'; binding.pry