require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'


class Computer
  attr_reader :board, :submarine, :cruiser, :fire_shot

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @fire_shot = all_coordinates
  end
end
