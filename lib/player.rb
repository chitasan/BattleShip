require './lib/board'
require './lib/ship'

class Player
  attr_reader :board

  def initialize
    @board = Board.new
    @submarine = Ship.new("submarine", 2)
    @cruiser = Ship.new("cruiser", 3)
  end

  def game_setup
    puts "My submarine(2) and cruiser(3) have been placed."
    puts "Please place your submarine(2) and cruiser(3)"
    # p @player.board.render
    place_sub
  end

  def place_sub
    p "Enter (2) coordinates for submarine"
    print "=> "
    coordinates = gets.chomp.upcase.split
    while !board.valid_placement?(@submarine, coordinates)
      p "You have entered invalid coordinates."
      p "Please try again"
      p "=> "
      coordinates = gets.chomp.upcase.split
    end
    @board.place(@submarine, coordinates)
 end
end
