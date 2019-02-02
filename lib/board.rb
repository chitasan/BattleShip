require './lib/cell'

class Board
    attr_reader :cells, :column, :row

    def initialize
        @columns = ("A".."D")
        @rows = (1..4)
        @cells = {}
    end 

    def create_cells
        @columns.each do |column|
            @rows.each do |row|
                key = "#{column}#{row}"
                cells[key] = Cell.new(key)
             end
        end
        @cells
    end

    def valid_coordinate?(coordinate) 
        create_cells.key?(coordinate)
    end

    def coordinate_column_to_oordinates(coordinates)
        split_coordinates = coordinates.map do |coordinate|
            coordinate.split('')
        end

        new_coordinates_with_oordinates_ordinate = split_coordinates.map do |coordinate|
            coordinate[0].to_s.ord
        end 

    end
    
    def split_coordinates(coordinates)
        coordinates.map do |coordinate|
            coordinate.split('')
        end
    end

    def consecutive?(coordinates)
        coordinates_into_string = coordinates.to_s.gsub!(/[^0-9A-Za-z]/, '')

        coordinates_into_string.chars.map(&:to_i).each_cons(2).all? {|x,y| x == y - 1}
        #use .ord?/ change columns into ordinates 
    end 

    def diagonal
    end

    def valid_placement?(ship, coordinates) 
        #same length:
        #ship.length == coordinates.length &&
        #conseutive? == true 
        #diagonal == false, rows || column must not match 
            #slope = +/-1
    end
end 


board = Board.new
p board.create_cells
p board.split_coordinates(["A1", "A2"])
p board.consecutive?(["A1", "A2"])
p board.coordinate_column_to_oordinates(["A1", "A2"])


#p board.coordinate_column_to_oordinates(["A1", "A2"])