class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty? #refactored if statement to boolean 
    @ship == nil
  end

  def place_ship(ship) #refactored
    @ship = ship
  end
end
