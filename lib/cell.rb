class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false 
  end

  def empty?
    @ship = nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fired_upon 
    @fired_upon = true 
    if @ship != nil 
      @ship.hit
    end
  end

  def render(boolean = nil) #nil for optional boolean arg (see iteration 1 directions)
    if @ship != nil && @fired_upon = true #refactor? 
      "H"
    elsif @ship = nil && @fired_upon = true
      "M"
    elsif @ship != nil && @fired_upon = true 
      "X"
    else 
      "."
    end 
  end 

end
