class Board
attr_reader :cells

  def initialize()
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length && consecutive?(coordinates) && overlapping?(coordinates)
  end
  
  def place(ship, coordinates)
    ship_placement = coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
    ship_placement
  end

  #........Helper Methods Below......

  def consecutive?(coordinates)
    (same_letter?(coordinates) && horizontal?(coordinates)) || (same_number?(coordinates) && vertical?(coordinates))
  end

  def same_letter?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0]
    end
    letters.uniq.count == 1
  end

  def same_number?(coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[1]
    end
    numbers.uniq.count == 1
  end


  def vertical?(coordinates)
    coord_ltrs = coordinates.map do |coordinate|
      coordinate[0]
    end
      range = coord_ltrs[0]..coord_ltrs[-1]
      coord_ltrs == range.to_a
  end

  def horizontal?(coordinates)
    coord_nums = coordinates.map do |coordinate|
      coordinate[1]
    end
      range = coord_nums[0]..coord_nums[-1]
      coord_nums == range.to_a
  end

  def overlapping?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def render(default = false)
    if default == true
      "  1 2 3 4 \n" +
      "A " "#{@cells["A1"].render(true)} " + "#{@cells["A2"].render(true)} " + "#{@cells["A3"].render(true)} " + "#{@cells["A4"].render(true)} \n" +
      "B " "#{@cells["B1"].render(true)} " + "#{@cells["B2"].render(true)} " + "#{@cells["B3"].render(true)} " + "#{@cells["B4"].render(true)} \n" +
      "C " "#{@cells["C1"].render(true)} " + "#{@cells["C2"].render(true)} " + "#{@cells["C3"].render(true)} " + "#{@cells["C4"].render(true)} \n" +
      "D " "#{@cells["D1"].render(true)} " + "#{@cells["D2"].render(true)} " + "#{@cells["D3"].render(true)} " + "#{@cells["D4"].render(true)} \n" 
    else
    # require 'pry'; binding.pry
    "  1 2 3 4 \n" +
    "A " "#{@cells["A1"].render} " + "#{@cells["A2"].render} " + "#{@cells["A3"].render} " + "#{@cells["A4"].render} \n" +
    "B " "#{@cells["B1"].render} " + "#{@cells["B2"].render} " + "#{@cells["B3"].render} " + "#{@cells["B4"].render} \n" +
    "C " "#{@cells["C1"].render} " + "#{@cells["C2"].render} " + "#{@cells["C3"].render} " + "#{@cells["C4"].render} \n" +
    "D " "#{@cells["D1"].render} " + "#{@cells["D2"].render} " + "#{@cells["D3"].render} " + "#{@cells["D4"].render} \n" 
    end
  end
end