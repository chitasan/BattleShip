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
<<<<<<< Updated upstream
=======

  def fired_upon?
    @fired_upon
  end

  def fired_upon #(fire_upon)
    
  end
>>>>>>> Stashed changes
end
