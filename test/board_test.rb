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

  def test_it_has_cells_attribute_and_attribute_class
    assert_equal Hash, @board.cells.class
  end

  def test_it_has_cells_taken_attribute_and_that_it_is_empty_by_default
    assert_equal [], @board.cells_taken
  end 

  def test_it_has_16_cells_with_key_value_pair
    @board.create_cells
    
    assert_equal 16, @board.cells.length
    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length
  end 
 
  def test_key_value_points_to_cell_objects
    @board.create_cells
    assert_equal Cell, @board.cells["A1"].class
  end 

  def test_it_can_validate_coordinates
    assert @board.valid_coordinate?("A1") 
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("F2")
  end 

  def test_it_can_validate_if_coordinates_are_same_length
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

  def test_it_validate_if_letters_are_consecutive
    assert @board.letters_consecutive?(@cruiser, ["A2", "B3", "C4"])
    refute @board.letters_consecutive?(@submarine, ["A2", "C3"])
  end

  def test_it_validate_if_numbers_are_consecutive
    assert @board.numbers_consecutive?(@cruiser, ["A2", "B3", "C4"])
    refute @board.numbers_consecutive?(@submarine, ["A1", "C3"])
  end 

  def test_it_can_validate_if_letter_coordinates_are_the_same
    assert @board.same_letter?(@cruiser, ["A2", "A3", "A4"])
    refute @board.same_letter?(@submarine, ["A2", "B3"])
  end 

  def test_it_can_validate_if_number_coordinates_are_the_same
    assert @board.same_number?(@cruiser, ["A3", "A3", "A3"])
    refute @board.same_number?(@submarine, ["A2", "B3"])
  end 

  def test_it_can_validate_if_coordinates_are_consecutive
    refute @board.consecutive?(@cruiser, ["A1", "A2", "A4"])
    refute @board.consecutive?(@submarine, ["A1", "C1"])
    refute @board.consecutive?(@cruiser, ["A3", "A2", "A1"])
    refute @board.consecutive?(@submarine, ["C1", "B1"])
    assert @board.consecutive?(@cruiser, ["B1", "B2" "B3"])
  end 

  def test_it_can_validate_if_coordinates_are_diagonal
    assert @board.diagonal?(@cruiser, ["A1", "B2", "C3"])
    assert @board.diagonal?(@submarine, ["C2", "D3"])
    refute @board.diagonal?(@cruiser, ["C1", "C2", "C3"])
    refute @board.diagonal?(@submarine, ["D1", "D2"])
  end 

  def test_it_can_validate_placement 
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
    refute @board.valid_placement?(@cruiser, ["A1", "C3"])
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
  end 

  def test_if_ships_can_be_placed_on_cells_and_cells_contain_same_ship
    @board.create_cells 
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]  

    assert_equal @cruiser, @board.cells["A1"].ship
    assert_equal @cruiser, @board.cells["A2"].ship
    assert_equal @cruiser, @board.cells["A2"].ship
    assert @board.cells["A3"].ship == @board.cells["A2"].ship
    assert @board.cells["A1"].ship == @board.cells["A2"].ship
  end

  def test_it_can_validate_overlap
    @board.create_cells 
    @board.place(@cruiser, ["A1", "A2", "A4"]) 
    assert @board.overlap?(@submarine, ["A2", "A3", "A4"])
    refute @board.overlap?(@cruiser, ["B1", "B2"])
  end

  def test_if_ships_overlap 
    @board.create_cells 
    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"] 

    @board.place(@submarine, ["A1", "B1"])

    refute @board.valid_placement?(@submarine, ["A1", "B1"])
  end 

  def test_it_can_return_array_of_row_coordinates
    @board.create_cells
    expected = [
      ["A1", "A2", "A3", "A4"], 
      ["B1", "B2", "B3", "B4"], 
      ["C1", "C2", "C3", "C4"], 
      ["D1", "D2", "D3", "D4"]
    ]

    assert_equal expected, @board.rows_array
  end
  
  def test_it_can_return_array_of_column_coordinates
    expected = [
      ["A1", "B1", "C1", "D1"], 
      ["A2", "B2", "C2", "D2"], 
      ["A3", "B3", "C3", "D3"], 
      ["A4", "B4", "C4", "D4"]
    ]
    
    assert_equal expected, @board.columns_array
  end 

  def test_it_can_render_empty_board
    @board.create_cells

    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @board.render
  end 

  def test_it_can_render_players_board_with_placed_ships 
    @board.create_cells
    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    expected = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, @board.render(true)
  end 
end 
  