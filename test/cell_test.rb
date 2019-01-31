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

<<<<<<< Updated upstream
  def test_ship_exists_in_cell
    cell = Cell.new("B4")
    assert_nil nil, cell.ship
  end

  def test_if_cell_is_empty #refactored test
=======
  def test_if_cell_has_no_ships #renamed test
>>>>>>> Stashed changes
    cell = Cell.new("B4")
    assert true, cell.empty?
  end

  def test_if_ship_can_be_placed_in_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal cruiser, cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

<<<<<<< Updated upstream
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
=======
  def test_if_cell_is_fired_upon?
    cell = Cell.new("B4") #removed instance of ship as we are testing am empty cell
    refute false, cell.fired_upon?

    cell = Cell.new("B4") #added this test to check if we can assert true
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert true, cell.fired_upon?
  end

  def test_the_ships_health_after_hit #rename to fire_upon instead of hit
    skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser) #need to place ship in cell, listing instances does not make it placed
    cell.fire_upon
    assert_equal 2, cell.ship.health #add in cell as the ship is in this cell
  end

  def test_the_ship_was_fired_upon ## Remove test becuase this is the same as test_if_cell_is_fired_upon
    skip
    cell = Cell.new("B4") #removed instance of ship as it is not needed since it's not placed in cell
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
  def test_it_represents_a_miss
=======
  def test_a_miss_fired_on_empty_cell
    skip
>>>>>>> Stashed changes
    cell = Cell.new("B4")
    assert true, cell.empty?
    assert true, cell.fired_upon?
    assert_equal "M", cell_1.render
<<<<<<< Updated upstream
  end     


=======
  end

  def test_that_cell_2_exists_with_a_ship
    skip
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3) ## Cruiser identifier different from cruiser above??? How to test?
    cell_2.place_ship(cruiser)
    assert_instance_of Cell, cell_2
    refute false, cell.empty? ## overkill?
    assert_equal ".", cell_2.render
    end

    def test_ship_with_optional_boolean_arg_to_reveal_unfired_ship
      assert_equal cruiser, cell.place_ship(cruiser) ## Maybe?
      assert true "S",cell_2.render(true)
    end
>>>>>>> Stashed changes
end
