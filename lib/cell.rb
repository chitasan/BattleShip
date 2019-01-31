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

  def render(boolean = false) #refactor, case statement?
    if @ship != nil && @fired_upon == true 
     "H"
      elsif @ship == nil && @fired_upon == true
        "M"
      elsif @fired_upon == true && @ship.sunk? == true && @ship == nil
        "X"
      elsif @ship.sunk? != true && boolean == true && @fired_upon == false
        "S"
      else 
        "."
      end 
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