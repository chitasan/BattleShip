require './lib/cell'

class Board
    attr_reader :cells, :y_coordinate, :x_coordinate

    def initialize
        @y_coordinate = ("A".."D")
        @x_coordinate = (1..4)
        @cells = {}
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

    def ordinals_array
        y_coordinate.map do |letter|
            letter.ord
        end 
    end

    def numbers_array
        x_coordinate.to_a
    end 

    def y_coordinates_to_ordinals
        coordinate_ordinal_hash = Hash.new
        @y_coordinate.each_with_index { |letter|
            coordinate_ordinal_hash[letter] = letter.ord }
        coordinate_ordinal_hash  
    end 

    def y_coordinates_same?(coordinates)
        y_coordinates = []

        split_coordinates = coordinates.map do |coordinate|
            coordinate.split('')
        end

        split_coordinates.each do |coordinates|
          y_coordinates << coordinates[0]
        end
         y_coordinates.uniq.size == 1
    end

    def x_coordinates_same?(coordinates)
        x_coordinates = []

        split_coordinates = coordinates.map do |coordinate|
            coordinate.split('')
        end

        split_coordinates.each do |coordinate|
            x_coordinates << coordinate[1].to_i
        end
        x_coordinates.uniq.size == 1
    end

    def convert_to_ordinals(letter_coords)
        ordinal = []
        letter_coords.each do |coordinate|
        ordinal << coordinate.ord
        end
        return ordinal
    end

    def consecutive?()
        split_coords.each_cons(2).all? do |x,y|
        y == x + 1
        end
        true
    end

    # def diagonal?(coordinates)
    #     @y_coordinates_same? == true || @x_coordinates_same? == true
    # end

    def overlap?(ship, coordinates)
        coordinates.all? do |cell|
        @create_cells[cell].empty?
        end
    end

    # def valid_placement?(ship, coordinates)
    #     @consecutive? == true &&
    #     @diagonal == false &&
    #     @same_length == true &&
    #     @overlap == false &&
    #end

    def place(ship, coordinates)
        coordinates.each do |cell|
        @cells[cell].place_ship(ship)
        end
    end

    def split_horiz_coordinates
        board_number_coords = @cells.keys
        split_coords = split_coordinates(board_number_coords)
        board_number_coords = store_number_coords(split_coords).uniq
    end

    def split_vert_coordinates
        board_letter_coords = @cells.keys
        split_coords = split_coordinates(board_letter_coords)
        board_letter_coords = store_letter_coords(split_coords).uniq
    end

    def render_horizontal
        horiz_coord = split_horiz_coordinates
        string_part_1 = "  "
        string_part_2 = []
        string_part_3 = "\n"
        horiz_coord.each do |num|
        string_part_2 << "#{num} "
        end
        return string_part_1 + string_part_2.join.to_s + string_part_3
    end

    def match_vertical_cells
        vert_coord = split_vert_coordinates
        board_render = render_horizontal
        value = vert_coord.map do |letter|
        board_render << letter + " "
        @cells.select do |coordinates, cell_object|
            if coordinates.include?(letter)
            board_render << @cells[coordinates].render + " "
            end
        end
        board_render << "\n"
        end
        return board_render
    end


    def render

    end
end 

    board = Board.new
    p board.create_cells
    p board.ordinals_array
    p board.numbers_array

    # cruiser = Ship.new("Cruiser", 3)
    # submarine = Ship.new("Submarine", 2)

    # p board.y_coordinates_same?(["A1", "A2", "A4"])
    # p board.x_coordinates_same?(["A1", "A2", "A4"])
    # p board.diagonal?(["A1", "A2", "A4"])
