require 'minitest/autorun'
require 'minitest/pride'
#require './lib/ship' --Cell class already requires ship in it's file, so I don't think we need this for it to run properly
#require './lib/cell' --Board class file requires cell 
require './lib/board'


class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_16_cells
    board = Board.new

    assert_equal 16, board.cells.length
  end 

  def test_coordinates_are_valid
    board = Board.new

    assert board.valid_coordinate?("A1") 
    assert board.valid_coordinate?("D4")
  end

  def test_coordinates_valid 
    board = Board.new
  
    refute board.valid_coordinate?("A5")
    refute board.valid_coordinate?("E1")
    refute board.valid_coordinate?("A22")
  end

  def test_if_coordinates_and_ship_are_same_length
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    

    refute board.same_length?(cruiser, ["A1", "A2"])
    assert board.same_length?(cruiser, ["A1", "A2", "A3"])
    refute board.same_length?(submarine, ["A1", "A2", "A3"])
    assert board.same_length?(submarine, ["A1", "A2"])
  end 

  def test_if_coordinates_are_consecutive


    refute board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    refute board.valid_placement?(submarine, ["A1", "C1"])
    refute board.valid_placement?(cruiser, ["A3", "A2", "A1"])
  end

  def test_if_coordinates_are_diagonal
  end 

  def test_if_placements_are_valid 
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.valid_placement?(cruiser, ["A1", "A2"])
    refute board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end
 
  def test_placements_are_not_valid #this test is the refute assertion in the test above 
  end

end
