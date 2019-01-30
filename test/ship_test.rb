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
  end

  def test_the_ships_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

  def test_if_ship_sunk
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
  end

  def test_if_ship_is_hit
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 
  end

end
