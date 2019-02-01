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

  #test if hit works

  def test_if_ship_sunk
    cruiser = Ship.new("Cruiser", 3)
    refute cruiser.sunk?

    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    refute cruiser.sunk?

    cruiser = Ship.new("Cruiser", 3)
    3.times do
      cruiser.hit
    end
    assert cruiser.sunk?

    cruiser = Ship.new("Cruiser", 3) #can delete if in same method 
    7.times do
      cruiser.hit
    end
    assert cruiser.sunk?
  end

  def test_the_ships_health_after_hit
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal 2, cruiser.health
  end

end
