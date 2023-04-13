require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell_1 = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cell_1).to be_a(Cell)
    end
  end

  describe '#coordinate' do
    it 'can have coordinates' do
      expect(@cell_1.coordinate).to eq("B4")
    end
  end

  describe '#ship' do
    it 'checks for a ship' do
      expect(@cell_1.ship).to eq(nil)
    end
  end

  describe '#empty?' do
    it 'checks if cell_1 is empty' do
      expect(@cell_1.empty?).to be(true)
    end
  end

  describe '#place_ship' do
    it 'places a ship' do    
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_1.empty?).to be(false) 
    end
  end
      
  describe '#fired_upon?' do
    it 'can get fired upon' do 
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.fired_upon?).to be(false)
      @cell_1.fire_upon
      expect(@cell_1.ship.health).to eq(2)
      @cell_1.fire_upon
      expect(@cell_1.fired_upon?).to be(true)
    end
  end

  describe '#render' do
    it 'can render a cell' do
      @cell_1 = Cell.new("B4")
      expect(@cell_1.render).to eq(".")
      @cell_1.fire_upon
      expect(@cell_1.render).to eq("M")
    end 

    it 'test render method' do 
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end
end