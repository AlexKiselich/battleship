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
require 'pry'; binding.pry
      expect(@board.cells).to be_a(Hash)
    end
  end
end   