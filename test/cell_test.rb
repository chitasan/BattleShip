require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'

 class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end

  def test_cell_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_attributes
    assert_equal "B4", @cell.coordinate
  end
 
  def test_cell_has_no_ships_by_default
    assert_nil nil, @cell.ship
    assert true, @cell.empty?
  end

  def test_fire_upon_is_false_by_default
    refute false, @cell.fire_upon
  end

  def test_if_ship_can_be_added_into_cell 
    @cell.place_ship(@cruiser)

    assert_equal @cruiser, @cell.ship
    refute false, @cell.empty?
  end

  def test_if_cell_is_fired_upon?
    refute @cell.fired_upon?

    @cell.place_ship(@cruiser)
    @cell.fire_upon 

    assert true, @cell.fired_upon?
  end

  def test_ship_health_after_cell_is_fire_upon
    @cell.place_ship(@cruiser) 
    @cell.fire_upon

    assert_equal 2, @cell.ship.health 
  end

  def test_board_result_when_cell_has_not_been_fired_upon
    assert_equal ".", @cell_1.render 
  end

  def test_board_result_when_cell_has_been_fired_upon_and_does_not_contain_ship
    @cell_1.fire_upon

    assert_equal "M", @cell_1.render
  end

  def test_board_results_when_cell_has_not_been_fired_upon_and_contains_a_ship
    @cell_2.place_ship(@cruiser)

    assert_equal "S", @cell_2.render(true)
  end 

  def test_board_result_when_cell_has_been_fired_upon_and_contains_ship
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon

    assert_equal "H", @cell_2.render
  end

  def test_board_result_when_cell_has_been_fired_upon_and_ship_has_been_sunk
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon

    refute @cruiser.sunk?
    assert_equal "H", @cell_2.render

    @cruiser.hit #martha refactor 
    @cruiser.hit

    assert @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end     
 end