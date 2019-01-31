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
    cells = { A..D => 1..4}
    assert true, board.valid_coordinate?("A1")
    assert true, board.valid_coordinate?("D4")
    end

  def test_coordinates_are_not_valid
    cells = { A..D => 1..4}
    refute false, board.valid_coordinate?("A5")
    refute false, board.valid_coordinate?("E1")
    refute false, board.valid_coordinate?("A22")
  end

  def test_placements_are_valid
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine.Ship.new("Submarine", 2)
  end

  def test_placements_are_not_valid
    
  end

  # def test_ship_with_optional_boolean_arg_to_reveal_unfired_ship
  #   cell_2 = Cell.new("C3")
  #   cell.place_ship(cruiser) ## Maybe?
  #   refute false, cell empty?
  #   assert true "S", cell_2.render(true)
  #
  # def test_M_represents_a_miss
  #   cell = Cell.new("B4")
  #   assert true, cell.empty?
  #   assert true, cell.fire_upon
  #   assert_equal "M", cell_1.render
  #
  # end
end
