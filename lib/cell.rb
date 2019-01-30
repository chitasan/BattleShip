class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def empty? #refactored if statement to boolean 
    @ship == nil
  end

<<<<<<< Updated upstream
  def place_ship(new_name)
    new_ship = Ship.new(name, length)
    @ship << new.ship
    return @ship 
=======
  def place_ship(ship) #refactored
    @ship = ship
>>>>>>> Stashed changes
  end
end
