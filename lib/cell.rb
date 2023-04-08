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
    @fired_upon = true
    if empty? == false
      @ship.hit
    end
  end
  
  def render(default = false)
    require 'pry'; binding.pry
    if @fired_upon == false && empty? == false && default == true
      "S"
    elsif @fired_upon == true && empty? == true
      "M"
      elsif @fired_upon == true && empty? == false && @ship.sunk?
        "X"
        elsif @fired_upon == true && empty? == false
          "H"
          elsif @fired_upon == false
            "."
    end
  end
  
end
