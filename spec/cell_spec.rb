require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
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

  describe '#empty?' do
    it 'checks if cell is empty' do
      expect(@cell.empty?).to be(true)
    end
  end

  describe '#place_ship' do
    it 'places a ship' do    
      @cell.place_ship(@cruiser)
      
      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to be(false) 
    end
  end
      
  describe '#fired_upon?' do
    it 'can get fired upon' do 
      @cell.place_ship(@cruiser)
      expect(@cell.fired_upon?).to be(false)

      @cell.fire_upon
      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to be(true)
    end
  end
end