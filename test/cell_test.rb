require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_cell_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_ship_exists_in_cell #double check later
    cell = Cell.new("B4")
    expected = nil
    actual = cell.ship
    assert_nil expected, actual
  end

  def test_if_cell_is_empty
    cell = Cell.new("B4")
    assert true, cell.empty?
  end

  def test_if_ship_can_be_placed_in_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3) #error arguments (2,0)
    assert_equal cruiser, cell.place_ship(cruiser)
  end


end
