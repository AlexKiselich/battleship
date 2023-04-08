require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
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
end   