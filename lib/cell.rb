class Cell
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false 
  end

  def empty?
    @ship = nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fire_upon
  end

  def fire_upon 
    @fire_upon = true 
    if @ship != nil 
      @ship.hit
    end
  end

  def render(boolean = false) #refactor, case statement? #choose conditional statement or boolean, below not both! 
    if @ship != nil && @fire_upon == true 
      "H"
    elsif @ship == nil && @fire_upon == true
      "M"
    elsif @fire_upon == true && @ship.sunk? == true && @ship == nil
      "X"
    elsif @ship.sunk? != true && boolean == true && @fire_upon == false
      "S"
    else 
      "."
    end 
  end

end
 
=begin
M
.
X
H 
S 
.
=end 