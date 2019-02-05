require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship' 

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end 

  def test_ship_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_if_hit_works_by_checking_ships_health
    @cruiser.hit

    assert_equal 2, @cruiser.health
  end 

  def test_if_ship_sinks_after_hit
    refute @cruiser.sunk?

    2.times do #Martha refactor 
      @cruiser.hit
    end 

    refute @cruiser.sunk?

    3.times do  #Martha to refactor this using {}
      @cruiser.hit
    end

    assert @cruiser.sunk?

    7.times do #Martha to refactor 
      @cruiser.hit
    end
    
    assert @cruiser.sunk?
  end

  def test_ships_health_after_hit 
    @cruiser.hit

    assert_equal 2, @cruiser.health

    @cruiser.hit #Martha to refactor 
    @cruiser.hit

    assert_equal 0, @cruiser.health

    @cruiser.hit 

    assert_equal -1, @cruiser.health
  end
end
