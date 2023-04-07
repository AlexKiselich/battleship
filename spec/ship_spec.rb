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

end