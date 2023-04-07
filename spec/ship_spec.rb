require 'spec_helper'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do
    it 'can initialize' do
     expect(@cruiser).to be_a(Ship)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@cruiser.name).to eq('Cruiser')
    end
  end

  describe '#length' do
    it 'has a length' do
      expect(@cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it 'has health points' do
      expect(@cruiser.health).to eq(3)
    end
  end

end