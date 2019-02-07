require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/computer'
require 'pry'

class Game

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def start
    welcome
  end

  def welcome
    puts "Welcome to BattleShip"
    puts "Enter p to play. Enter q to quit."
    print "=> "
    input = gets.chomp.downcase

    while input != "p" && input != "q"
      puts "Invalid entry. Please try again"
      print "> "
      input = gets.chomp.downcase
    end

    if input == "p"
      puts @board.create_cells
      puts @board.render(true)
      puts @player.place_sub
    elsif input == "q"
      puts "Thank you for playing!"
    end
  end

  def main_menu
    @computer.place_ships
    puts "My submarine(2) and cruiser(3) have been placed."
    puts "Please place your Submarine - 2 coordinates"
    puts @player.board.render
    puts "Enter (2) coordinates for submarine"
    print "=> "
    coordinates = gets.chomp.upcase.split

    while !@player.board.valid_placement?(@player.submarine, coordinates)
      puts "You have entered invalid coordinates."
      puts "Please try again."
      print "=> "
      coordinates = gets.chomp.upcase.split
    end

    @player.place_ship(@player.submarine, coordinates)
    puts @player.board.render(true)

    puts "Enter your Cruiser - 3 coordinates"
    print "=> "
    coordinates = gets.chomp.upcase.split

    while !@player.board.valid_placement?(@player.submarine, coordinates)
      puts "You have entered invalid coordinates."
      puts "Please try again"
      print "=> "
      coordinates = gets.chomp.upcase.split
    end

    @player.place_ship(@player.cruiser, coordinates)
    print @player.board.render(true)
    print "Ships have been placed. Lets play Battleship!!!"
  end
end
