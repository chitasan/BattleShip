require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require '.lib/board'

class BoardTest < Minitest::Test

  def test_cell_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_attributes

  end

  def test_coordinates_are_valid
  end

  def test_coordinates_are_not_valid
  end

  def test_placements_are_valid
  end

  def test_placements_are_not_valid
  end
end
