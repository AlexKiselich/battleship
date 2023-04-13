class Game

  attr_reader :comp_board,
              :comp_cruiser,
              :comp_submarine,
              :player_board,
              :player_cruiser,
              :player_submarine,
              :comp_sunk_ships,
              :player_sunk_ships

  def initialize
    @comp_board = Board.new
    @player_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @comp_sunk_ships = 0
    @player_sunk_ships = 0
  end

  def menu      
         
   puts "    ██     ██ ██████  ██       ██████  ██████  ███    ███ ██████     ████████  ██████      ██████   █████  ████████ ████████ ██      ███████ ███████ ██   ██ ██ ██████   ██"
   sleep(0.5)
   puts "   ██     ██ ██      ██      ██      ██    ██ ████  ████ ██            ██    ██    ██     ██   ██ ██   ██    ██       ██    ██      ██      ██      ██   ██ ██ ██   ██  ██"
   sleep(0.5)
   puts "  ██  █  ██ █████   ██      ██      ██    ██ ██ ████ ██ █████         ██    ██    ██     ██████  ███████    ██       ██    ██      █████   ███████ ███████ ██ ██████   ██"
   sleep(0.5)
   puts " ██ ███ ██ ██      ██      ██      ██    ██ ██  ██  ██ ██            ██    ██    ██     ██   ██ ██   ██    ██       ██    ██      ██           ██ ██   ██ ██ ██" 
   sleep(0.5)
   puts "█████████ ██████  ███████  ██████  ██████  ██      ██ ██████        ██     ██████      ██████  ██   ██    ██       ██    ███████ ███████ ███████ ██   ██ ██ ██        ██\n\n\n"    
                                                                                                                                                                                                                                                
    
    
    
    
    
    sleep(1.0)
    puts "Hello!\n\n"
    sleep(0.5)
    puts "What is your name?"
    name = gets.chomp.capitalize
    puts "\n\nHello #{name}, Welcome to Battleship!\n\n"
    sleep(1.0)
    puts "Please enter 'p' to play a game or 'q' to quit"
    sleep(0.5)
    input = gets.chomp
      if input == "p" 
        sleep(0.5)
        puts "\n\nPlay game!\n\n"
          elsif input == "q"
          puts "See you next time!\n\n"
          menu
        else
          puts "Invalid, please try again!\n\n"
          menu
        end
  end

  def comp_ship_placement
    comp_cruz_placement
    comp_sub_placement
    sleep(0.5)
    puts comp_board.render
    puts "=============COMPUTER BOARD=============\n\n"
    sleep(0.5)
      puts "I have laid out my ships on the grid above.\n\n"
      sleep(0.5)
      puts "You now need to lay out your two ships.\n\n"
      sleep(0.5)
      puts "The Cruiser is three units long and the Submarine is two units long.\n\n"
      sleep(0.5)
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
      sleep(0.5)
      puts "Enter the squares for the Cruiser (3 spaces):"
        player_cruiser_input = gets.chomp.upcase.split
        if player_board.valid_placement?(@player_cruiser, player_cruiser_input) == true
          player_board.place(@player_cruiser, player_cruiser_input)
        else
          sleep(0.5)
          puts "Those are invalid coordinates. Please try again:"
          player_cruiser_placement
        end
    end

    def player_submarine_placement
      sleep(0.5)
      puts "\n\nEnter the squares for the Submarine (2 spaces):"
      player_submarine_input = gets.chomp.upcase.split
      if player_board.valid_placement?(@player_submarine, player_submarine_input) == false
        sleep(0.5)
        puts "Those are invalid coordinates. Please try again:"
        player_submarine_placement
      else
        player_board.place(@player_submarine, player_submarine_input)
      end
    end

    def turn
      sleep(0.5)
      puts comp_board.render
      puts "=============COMPUTER BOARD=============\n\n"
      sleep(0.5)
      puts player_board.render(true)
      puts "=============PLAYER BOARD=============\n\n"

# player turn --------------------------------
      sleep(0.5)
      puts 'Enter the coordinate for your shot:'
      cell = gets.chomp.upcase
      if comp_board.valid_coordinate?(cell) == true && comp_board.cells[cell].fired_upon? == false
        comp_board.cells[cell].fire_upon
        player_result = comp_board.cells[cell].render
          if player_result == "X"
            @player_sunk_ships += 1
          end
      else 
        puts 'Please enter a valid coordinate'
        sleep(0.5)
        turn
      end

# computer turn --------------------------------

      comp_turn = player_board.cells.keys.sample(1).join
      until player_board.cells[comp_turn].fired_upon? == false
        comp_turn = player_board.cells.keys.sample(1).join
      end
      # require 'pry'; binding.pry
      player_board.cells[comp_turn].fire_upon
      # end

      comp_result = player_board.cells[comp_turn].render(true)
        if comp_result == "X"
          @comp_sunk_ships += 1
        end
      sleep(0.5)
      puts "\n\nYour shot on #{cell} was a #{player_result}\n\n"
      sleep(0.5)
      puts "My shot on #{comp_turn} was a #{comp_result}\n\n"
      sleep(0.5)
    end?
  end
  
  def end?
    if @comp_sunk_ships == 2 
      sleep(0.5)
      puts "I won!\n\n"
      sleep(0.5)
      menu
    elsif
      @player_sunk_ships == 2 
      sleep(0.5)
      puts "You won!\n\n"
      sleep(0.5)
      menu
    else
      turn
    end
  end
end