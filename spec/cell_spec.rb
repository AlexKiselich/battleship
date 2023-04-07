require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
  end

  describe '#initialize' do
    it 'can initialize' do
     expect(@cell).to be_a(Cell)
    end
  end

  describe '#coordinate' do
    it 'can have coordinates' do
      expect(@cell.coordinate).to eq("B4")
    end
  end

  describe '#ship' do
    it 'checks for a ship' do
      expect(@cell.ship).to eq(nil)
    end
  end

  
end