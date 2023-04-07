class Cell
  attr_reader :coordinate, 
              :ship, 
              :fired_upon
  
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
     @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    # require 'pry'; binding.pry
    if empty?
    @fired_upon
    else
      @fired_upon = true
      @ship.hit
    end
  end

  def render
    if empty?
      "M"
    else
      

  end

end
