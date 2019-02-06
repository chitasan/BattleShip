require './lib/ship'

class Cell
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @fire_upon  = false 
  end

  def empty?
    @ship == nil
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

  def render(player_board = false)
    case 
      when @ship != nil && @fire_upon == true && @ship.sunk? == false then "H"
      when @ship == nil && @fire_upon == true then "M"
      when @fire_upon == true && @ship.sunk? == true && @ship != nil then "X"
      when @ship != nil && player_board == true && @fire_upon == false then "S"
    else "."
    end 
  end
end
