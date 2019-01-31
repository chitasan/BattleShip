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
    refute false, cell.fired_upon #added this as an initialized method as it'll be called on in other methods 
  end

  def test_if_cell_has_no_ships #renamed test. should we go with empty?
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
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render 

    cell_1 = Cell.new("B4")
    cell_1.fired_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
  end

  def test_it_represents_a_miss
    skip
    cell = Cell.new("B4")
    assert_equal "M", cell_1.render
  end     
end
