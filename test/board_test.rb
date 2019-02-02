require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that_cells_attribute_and_is_a_hash
    board = Board.new

    assert_equal Hash, board.cells.class
    #assert_equal 16, board.cells.keys.length -- cannot test till as actual = 0
  end

  def test_it_has_16_cells_with_key_value_pairs
    board = Board.new

    assert_equal 16, board.create_cells.keys.length
    assert_equal 16, board.create_cells.values.length
  end 
  #how to test keys point to cell objects

  def test_coordinates_are_valid
    board = Board.new

    assert board.valid_coordinate?("A1") 
    assert board.valid_coordinate?("D4")
  end

  def test_coordinates_are_same_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.valid_placement?(cruiser, ["A1", "A2"])
    refute board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert board.valid_placement?(cruiser, ["A2", "A3", "A4"])
    assert board.valid_placement?(submarine, ["A1", "A2"])
  end

  def test_coordinates_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.valid_placement?(cruiser, ["A1", "A2", "A4")
    refute board.valid_placement?(submarine, ["A1", "C1"])
    refute board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    refute board.valid_placement?(submarine, ["C1", "B1"])
    #make assert tests
  end

  def test_coordinates_are_not_diagonal 
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  
    refute board.valid_placement?(cruiser, ["A1", "B2", "C3")
    refute board.valid_placement?(submarine, ["C2", "D3"]
    #make assert tests
  end 

  def test_placements_are_valid 
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert board.valid_placement?(cruiser, ["B1", "C1", "D1")
    assert board.valid_placement?(submarine, ["A1", "A2"]
    refute board.valid_placement?(cruiser, ["A1", "B2", "C3")
    refute board.valid_placement?(submarine, ["C2", "D3"]
  end

  def test_if_ships_can_be_placed_on_cells
  end

  def test_if_cells_contain_the_same_ship
  end

  def test_if_ships_overlap
  end 

  def 
end