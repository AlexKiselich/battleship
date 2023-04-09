require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@board).to be_a(Board)
    end
  end

  describe '#cells' do
    it 'has cells' do
      @board = Board.new
      expect(@board.cells).to be_a(Hash)
    end
  end

  describe '#valid_coordinate?' do
    it 'validates coordinates' do
      @board = Board.new
      expect(@board.valid_coordinate?('A1')).to eq(true)
      expect(@board.valid_coordinate?('D4')).to eq(true)
      expect(@board.valid_coordinate?('A5')).to eq(false)
      expect(@board.valid_coordinate?('E1')).to eq(false)
      expect(@board.valid_coordinate?('A22')).to eq(false)
    end
  end

  describe '#valid_placement?' do
    it 'validates placement of a ship' do
      expect(@board.valid_placement?(@cruiser, ['A1', 'A2'])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end

    it '#place' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]

      expect(cell_1.ship).to eq(@cruiser)
      expect(cell_2.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(@cruiser)

      expect(cell_3.ship == cell_2.ship).to eq(true)
    end

    it 'prevents overlapping ships' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe "#render" do 
    it 'can render' do
      @board.place(@cruiser, ["A1", "A2", "A4"])
      expect(@board.render).to eq("  1 2 3 4 \nA.... \nB.... \nC.... \nD.... \n")
      expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end

  #......Helper Methods tests.......

  describe '#consecutive?' do
    it 'can check if coordinates are consecutive' do
      expect(@board.consecutive?(["A1", "A4"])).to eq(false)
      expect(@board.consecutive?(["A1", "A2"])).to eq(true)
    end
  end

  describe '#same_letter?' do
    it 'can check it the coordinates have the same letter' do
      expect(@board.same_letter?(["A1", "A2"])).to eq(true)
      expect(@board.same_letter?(["A1", "B1"])).to eq(false)
    end
  end

  describe '#same_number?' do
    it 'can check it the coordinates have the same number' do
      expect(@board.same_number?(["A1", "A2"])).to eq(false)
      expect(@board.same_number?(["A1", "B1"])).to eq(true)
    end
  end

  describe '#vertical?' do
    it 'can check to see if coordinates are vertical' do
      expect(@board.vertical?(["A1", "A2", "A3"])).to eq(false)
      expect(@board.vertical?(["A1", "B1", "C1"])).to eq(true)
    end
  end

  describe '#horizontal?' do
    it 'can check to see if coordinates are horizontal' do
      expect(@board.horizontal?(["A1", "A2", "A3"])).to eq(true)
      expect(@board.horizontal?(["A1", "B1", "C1"])).to eq(false)
    end
  end

  describe '#overlapping?' do
    it 'can check to see if coordinates are overlapping' do
      
      expect(@board.overlapping?(["A1", "A2"])).to eq(true)
      
    end
  end

end



