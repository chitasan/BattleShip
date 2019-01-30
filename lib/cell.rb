class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
    #

  end

  def fired_upon #(fire_upon)
    #ship is fired_upon (use ship.hit from class ship), otherwise, no fired upon if no ship
    #use boolean/conditional statement
  end
end
