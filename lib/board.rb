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
    ship.length == coordinates.length && consecutive?(coordinates)
  end

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

  def ranges
    { range_number: '1'..'4',
      range_letter: 'A'..'D'
    }
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

  # def ranges
  #   { range_A: 'A1'..'A4',
  #     range_B: 'B1'..'B4',
  #     range_C: 'C1'..'C4',
  #     range_D: 'D1'..'D4',
  #     range_1: 'A1'..'D1',
  #     range_2: 'A2'..'D2',
  #     range_3: 'A3'..'D3',
  #     range_4: 'A4'..'D4'
  #   }
  # end
end

# same_letter?(coordinates) or same_number?(coordinates), iterate through, letters can be called by first index, numbers can be called by last index (-1).
# first check all letters, then check to see if letters are in a range. If true, true. Letters need to match the range.
# do same thing for numbers.
# 

# check if the coordinates exist in the range
# need to establish the range
# we need to know our ranges
# test that we did checked to include our array and not the elements inside the array

# coordinates need to be consecutive
# I want 1-4 to be true, needs to be consecutive.
# 1,2,4 would return false
# 
# ranges = [range_A = 'A1'..'A4',
#           range_B = 'B1'..'B4',
#           range_C = 'C1'..'C4',
#           range_D = 'D1'..'D4',
#           range_1 = 'A1'..'D1',
#           range_2 = 'A2'..'D2',
#           range_3 = 'A3'..'D3',
#           range_4 = 'A4'..'D4'
#         ]
# if coordinates == ranges
#   true
# else
#   false
# end