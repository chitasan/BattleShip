require './lib/cell'
require 'pry'

class Board
	attr_reader :cells, :x_coordinate, :y_coordinate, :cells_taken 

	def initialize
		@x_coordinate = (1..4)
		@y_coordinate = ("A".."D")
		@cells = {}
		@cells_taken = []
	end

	def create_cells
		y_coordinate.each do |letter|
				x_coordinate.each do |number|
						coordinate = "#{letter}#{number}"
						cells[coordinate] = Cell.new(coordinate)
					end
		end
		cells
	end

	def valid_coordinate?(coordinate)
		create_cells.key?(coordinate)
	end

	def same_length?(ship, coordinates)
		ship.length == coordinates.length
	end 

	def split_coordinates(ship, coordinates)
		split_coordinates = []
		coordinates.map do |coordinate|
				split_coordinates << coordinate.split('').to_a
		end 
		split_coordinates.flatten
	end 

	def y_coordinates_ordinal_values(ship, coordinates)
		split_coords = split_coordinates(ship, coordinates)

		letters = split_coords.reject do |coordinate| 
				["1", "2", "3", "4"].include?(coordinate)
		end 

		ordinal_value = letters.map do |letter|
				letter.to_s.ord
		end 
	end

	def x_coordinates_numbers(ship, coordinates)
		split_coords = split_coordinates(ship, coordinates)

		numbers = split_coords.reject do |coordinate| 
				["A", "B", "C", "D"].include?(coordinate)
		end 

		numbers.map do |number|
				number.to_i
		end 
	end 

	def letters_consecutive?(ship, coordinates)
		ordinals = y_coordinates_ordinal_values(ship, coordinates)
		ordinals.each_cons(2).all? do |ordinal_1, ordinal_2|
				ordinal_2 == ordinal_1 + 1
		end
	end 

	def numbers_consecutive?(ship, coordinates)
		numbers = x_coordinates_numbers(ship, coordinates)
		numbers.each_cons(2).all? do |number_1, number_2|
				number_2 == number_1 + 1
		end
	end

	def same_letter?(ship, coordinates)
		y_coordinates = []

		split_coordinates = coordinates.map do |coordinate|
				coordinate.split('')
		end

		split_coordinates.each do |coordinates|
			y_coordinates << coordinates[0]
		end

			y_coordinates.uniq.size == 1
	end

	def same_number?(ship, coordinates)
		x_coordinates = []

		split_coordinates = coordinates.map do |coordinate|
				coordinate.split('')
		end

		split_coordinates.each do |coordinate|
				x_coordinates << coordinate[1].to_i
		end
		x_coordinates.uniq.size == 1
	end

	def consecutive?(ship, coordinates)
		(same_number?(ship, coordinates) && letters_consecutive?(ship,coordinates)) ||
		(same_letter?(ship, coordinates) && numbers_consecutive?(ship,coordinates))
	end 

	def diagonal?(ship, coordinates) 
		if (consecutive?(ship, coordinates) && 
			(same_letter?(ship, coordinates)) || 
			same_number?(ship, coordinates))
			return false 
		end
		return true 
	end

	def overlap?(ship, coordinates)
		coordinates.any? do |coordinate|
				@cells_taken.include?(coordinate)
		end 
	end 

	def valid_placement?(ship, coordinates)
		if same_length?(ship, coordinates) == true &&
			overlap?(ship, coordinates) == false &&
			diagonal?(ship, coordinates) == false &&
			consecutive?(ship, coordinates) == true 
			return true 
		end 
		false 
	end

	def place(ship, coordinates)
		coordinates.each do |coordinate|
				@cells[coordinate].place_ship(ship)
				@cells_taken << coordinate 
		end
	end 

	def rows
		letters = @y_coordinate.to_a
		numbers = Array.new(4, @x_coordinate.to_a)
		numbers.map.with_index do |numbers_array, index|
				numbers_array.map do |number|
					"#{letters[index]}#{number}"
				end
		end 
	end 

	def columns 
		rows.transpose
	end 

	def render 
		board = rows.map

	end 
end 
