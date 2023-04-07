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
    it 'can coordinate' do
      expect(@cell).to eq("B4")
end