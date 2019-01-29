class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def empty?
    if @ship == 0
      true
    else
      false
    end
  end

  def place_ship(new_name)
    new_ship = Ship.new(name, length)
    @ship << new.ship
    return @ship 
  end
end
