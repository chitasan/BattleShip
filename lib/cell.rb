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

<<<<<<< HEAD
  def fired_upon #(fire_upon)
    
=======
  def fired_upon 
    @fired_upon = true 
    if @ship != nil 
      @ship.hit
    end
>>>>>>> 0f6fe03c0b30ba1361b4527bde5820a7fb6d541e
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
