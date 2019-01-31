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
    assert_nil nil, cell.ship #moved this from a separate test as ship is an attribute, too
<<<<<<< HEAD
  end

<<<<<<< Updated upstream
  def test_ship_exists_in_cell
    cell = Cell.new("B4")
    assert_nil nil, cell.ship
  end
908
  def test_if_cell_is_empty #refactored test
=======
  def test_if_cell_has_no_ships #renamed test
>>>>>>> 4d8555e6e582b685f4cdfc2705dcd6c037a4b481
=======
    refute false, cell.fired_upon #added this as an initialized method as it'll be called on in other methods 
  end

  def test_if_cell_has_no_ships #renamed test. should we go with empty?
>>>>>>> 0f6fe03c0b30ba1361b4527bde5820a7fb6d541e
    cell = Cell.new("B4")
    assert true, cell.empty?
  end

  def test_if_ship_can_be_added_into_cell #how descriptive do i need to be with mult assertions? 
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
    refute false, cell.empty?
  end

<<<<<<< HEAD
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

  def test_the_ship_was_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
=======
    skip
    cell = Cell.new("B4") #removed instance of ship as it is not needed since it's not placed in cell
>>>>>>> 4d8555e6e582b685f4cdfc2705dcd6c037a4b481
    assert true, cell.fired_upon?
  end

  def test_that_cell_1_exists
    skip
=======
  def test_if_cell_is_fired_upon_and_test_ships_health_after_hit 
    cell = Cell.new("B4") #removed instance of ship as we are testing an empty cell 
    refute false, cell.fired_upon?

    cell = Cell.new("B4") #added this test to check if we can assert true with ship in cell 
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser) 
    assert true, cell.fired_upon? #do i need to do both assertions? 
    assert true, cell.fired_upon
    assert_equal 2, cell.ship.health #moved assertions to test health, should i make it separate test method? 
  end

  #def test_that_cell_1_exists 
    #cell_1 = Cell.new("B4")
    #assert_instance_of Cell, cell_1
  #end
  #we have already tested that we can assert an instance of Cell, so we don't need to do it again as our code works; I believe we are to proceed with the assumption that these are real instances. This is a good question to ask someone, maybe? We are to use cell_1 and cell_2 to test when/if cell is fired upon, results to print on board as miss (M), hit (H), sunk (X), or not fired upon (.) on specific cell coordinate. 

  def test_results_to_print_the_board_if_cell_is_fired_upon
>>>>>>> 0f6fe03c0b30ba1361b4527bde5820a7fb6d541e
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render 

<<<<<<< HEAD
  def test_it_represents_a_cell_that_has_not_been_fired_upon
    skip
=======
>>>>>>> 0f6fe03c0b30ba1361b4527bde5820a7fb6d541e
    cell_1 = Cell.new("B4")
    cell_1.fired_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
  end

  def test_it_represents_a_miss
<<<<<<< HEAD
<<<<<<< HEAD
=======
    skip
>>>>>>> 4d8555e6e582b685f4cdfc2705dcd6c037a4b481
=======
    skip
>>>>>>> 0f6fe03c0b30ba1361b4527bde5820a7fb6d541e
    cell = Cell.new("B4")
    assert true, cell.empty?
    assert true, cell.fired_upon?
    assert_equal "M", cell_1.render
<<<<<<< HEAD
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
=======
>>>>>>> 4d8555e6e582b685f4cdfc2705dcd6c037a4b481
=======
  end     
>>>>>>> 0f6fe03c0b30ba1361b4527bde5820a7fb6d541e
end
