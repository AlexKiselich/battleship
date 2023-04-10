require 'spec_helper' 

RSpec.describe Game do
  it "exists" do
    @game = Game.new

    expect(@game).to be_a Game
  end

  it "has a menu" do
    @game = Game.new
    @game.menu
  end
end