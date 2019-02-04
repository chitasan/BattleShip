require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end 

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_that_cells_attribute_and_is_a_hash
    assert_equal Hash, @board.cells.class
  end

  def test_it_can_create_16_cells_with_key_value_pair
    @board.create_cells

    assert_equal 16, @board.cells.length
    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length
  end 
 
  # BELOW - do I test for this? how? 
  # def test_key_value_points_to_cell_objects
  #   expected = <Cell:0xXXXXXX @coordinate="A1", @ship=nil, @fire_upon=false>
  #   assert_equal expected, @board.create_cells["A1"]
  # end 

  def test_coordinates_are_valid
    assert @board.valid_coordinate?("A1") 
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("F2")
  end

  def test_coordinates_are_same_length
    refute @board.same_length?(@submarine, ["A2", "A3", "A4"])
    refute @board.same_length?(@cruiser, ["A1", "A2"])
    assert @board.same_length?(@submarine, ["A1", "A2"])
    assert @board.same_length?(@cruiser, ["A1", "A2", "A4"])
  end

  def test_it_can_split_coordinates_into_a_flattened_array
    expected = ["A", "2", "B", "3", "C", "4"]
    actual = @board.split_coordinates(@submarine, ["A2", "B3", "C4"])

    assert_equal expected, actual 
  end 

  def test_it_can_convert_letter_coordinates_into_ordinal_values 
    expected = [65, 66, 68]
    actual = @board.y_coordinates_ordinal_values(@cruiser, ["A2", "B3", "D4"])

    assert_equal expected, actual 
  end 

  def test_it_can_convert_number_coordinates_into_integers
    expected = [2, 3, 4]
    actual = @board.x_coordinates_numbers(@cruiser, ["A2", "B3", "C4"])

    assert_equal expected, actual
  end 

  def test_it_can_return_if_letters_are_consecutive

  end

  def test_it_can_return_if_numbers_are_consecutive
  end 

  def test_it_can_return_if_letter_coordinates_are_the_same
    assert @board.same_letter?(@cruiser, ["A2", "A3", "A4"])
    refute @board.same_letter?(@cruiser, ["A2", "B3", "A4"])
  end 

  def test_it_can_return_if_number_coordinates_are_the_same
    assert @board.same_number?(@cruiser, ["A3", "A3", "A3"])
    refute @board.same_number?(@cruiser, ["A2", "B3", "A4"])
  end 

  def test_coordinates_are_consecutive
    refute @board.consecutive?(@cruiser, ["A1", "A2", "A4"])
    refute @board.consecutive?(@submarine, ["A1", "C1"])
    refute @board.consecutive?(@cruiser, ["A3", "A2", "A1"])
    refute @board.consecutive?(@submarine, ["C1", "B1"])
    assert @board.consecutive?(@cruiser, ["B1", "B2" "B3"])
  end 

  def test_coordinates_are_not_diagonal
    refute @board.not_diagonal?(@cruiser, ["A1", "B2", "C3"])
    refute @board.not_diagonal?(@submarine, ["C2", "D3"])
    assert @board.not_diagonal?(@cruiser, ["C1", "C2", "C3"])
    assert @board.not_diagonal?(@submarine, ["D1", "D2"])
  end 

  def test_placements_are_valid
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
    refute @board.valid_placement?(@cruiser, ["A1", "C3"])
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
  end

#   def test_if_ships_can_be_placed_on_cells
#   end

#   def test_if_cells_contain_the_same_ship
#   end

#   def test_if_ships_overlap
#   end 
end 