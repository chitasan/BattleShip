require 'minitest/autorun'
require 'minitest/pride'
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
  end
 
  def test_cell_has_no_ships_by_default
    cell = Cell.new("B4")

    assert_nil nil, cell.ship
    assert true, cell.empty?
  end

  def test_fire_upon_is_false_by_default
    cell = Cell.new("B4")

    refute false, cell.fire_upon
  end

  def test_if_ship_can_be_added_into_cell 
    cell = Cell.new("B4")

    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal cruiser, cell.ship
    refute false, cell.empty?
  end

  def test_if_cell_is_fired_upon?
    cell = Cell.new("B4") 

    refute cell.fired_upon?

    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon #command

    assert true, cell.fired_upon? #query
  end

  def test_ship_health_after_cell_after_fire_upon
    cell = Cell.new("B4") 
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser) 
    cell.fire_upon

    assert_equal 2, cell.ship.health 
  end

  def test_board_result_when_cell_has_not_been_fired_upon
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render 
  end

  def test_board_result_when_cell_has_been_fired_upon_and_does_not_contain_ship
    cell_1 = Cell.new("B4")

    cell_1.fire_upon

    assert_equal "M", cell_1.render
  end

  def test_board_results_when_cell_has_not_been_fired_upon_and_contains_a_ship
    
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal "S", cell_2.render(true)
  end 

  def test_board_result_when_cell_has_been_fired_upon_and_contains_ship
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    
    cell_2.fire_upon

    assert_equal "H", cell_2.render
  end

  def test_board_result_when_cell_has_been_fired_upon_and_ship_has_been_sunk
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    
    cell_2.fire_upon

    refute cruiser.sunk?
    assert_equal "H", cell_2.render

    cruiser.hit
    cruiser.hit

    assert_equal cruiser, cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

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
    skip
    cell = Cell.new("B4") #removed instance of ship as it is not needed since it's not placed in cell 
    assert true, cell.fired_upon?
  end

end
