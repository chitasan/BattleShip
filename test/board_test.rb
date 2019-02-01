require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_cell_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_attributes_to_test
    cells = { A..D => 1..4 }
  end

  def test_coordinates_are_valid
    cells = { A..D => 1..4 }
    assert board.valid_coordinate?("A1")
    assert board.valid_coordinate?("D4")
  end

  def test_coordinates_are_not_valid
    cells = { A..D => 1..4 }
    refute board.valid_coordinate?("A5")
    refute board.valid_coordinate?("E1")
    refute board.valid_coordinate?("A22")
  end

  def test_a_valid_placement_is_the_length_of_the_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine.Ship.new("Submarine", 2)
    refute board.valid_placement?(cruiser, ["A1", "A2"])
    refute board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_are_consecutive
    refute board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    refute board.valid_placement?(submarine, ["A1", "C1"])
    refute board.valid_placement?(cruiser, ["A3", "A2", "A1"])
  end

end
