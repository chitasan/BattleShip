require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'pry'

class Game
  attr_reader :player, :computer, :board

  def initialize
    @player = Player.new
    @computer = computer
    @board = Board.new


  end

  def main_menu
    p "Welcome to BattleShip"
    p "Enter p to play. Enter q to quit."
    print "=> "
    input = gets.chomp.downcase
    if input == "q"
      "Thank you for playing!"
    elsif input == "p"
      @board.create_cells
      puts @board.render
      @player.place_sub
    end
  end

  # def game_setup
  #   @computer.place
  #   "My submarine(2) and cruiser(3) have been placed./n"
  #   "Please place your submarine(2) and cruiser(3)/n"
  #   p @player.board.render
  # end

  # def place_sub
  #   p "Enter (2) coordinates for submarine"
  #   p "=> "
  #   coordinates = gets.chomp.upcase.split
  #   while !@player.board.valid_placement?(@player.submarine, coordinates)
  #     p "You have entered invalid coordinates./n"
  #     p "please try again/n"
  #     p "=> "
  #     coordinates = gets.chomp.upcase.split
  #   end
  # end
end


  # def coordinates
  #   p "Enter (3) coordinates for cruiser"
  #   p "=> "
  #   coordinates = gets.chomp.upcase.split
  #   while !@player.board.valid_placement?(@player.cruiser, coordinates)
  #     p "You have entered invalid coordinates./n"
  #     p "please try again/n"
  #     p "=> "
  #     coordinates = gets.chomp.upcase.split
  #
  #        @player.board.place(@player.cruiser, coordinates)
  #   puts @player.board.render(true)
  #   puts "Ships have been placed.\nLets begin!"
  #   end
  # end
