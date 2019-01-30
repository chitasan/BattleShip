require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

 class CellTest < Minitest::Test
#
  def test_cell_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_ship_exists_in_cell
    cell = Cell.new("B4")
    assert_nil nil, cell.ship
  end

  def test_if_cell_is_empty #refactored test
    cell = Cell.new("B4")
    assert true, cell.empty?
  end

  def test_if_ship_can_be_placed_in_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal cruiser, cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_if_ship_was_not_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    refute false, cell.fired_upon?
  end

  def test_the_ships_health_after_hit
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 2, ship.health
  end

  def test_the_ship_was_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert true, cell.fired_upon?
  end

  def test_that_cell_1_exists
    cell_1 = Cell.new("B4")
    assert_instance_of Cell, cell_1
  end

  def test_it_represents_a_cell_that_has_not_been_fired_upon
    cell_1 = Cell.new("B4")
    refute false, cell_1.fire_upon
    assert_equal ".", cell_1.render
  end

  def test_it_represents_a_miss
    cell = Cell.new("B4")
    assert_equal "M", cell_1.render
  end     


end
