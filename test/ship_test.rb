require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_ship_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
    assert_equal 3, cruiser.health
  end

  def test_if_ship_sunk
    cruiser = Ship.new("Cruiser", 3)
    refute false, cruiser.sunk?

    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    refute false, cruiser.sunk?

    cruiser = Ship.new("Cruiser", 3)
    3 * cruiser.hit
    assert true, cruiser.sunk?

    cruiser = Ship.new("Cruiser", 3)
    7 * cruiser.hit
    assert true, cruiser.sunk?
  end

  def test_the_ships_health_after_hit
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit 
    assert_equal 2, cruiser.health
  end

end
