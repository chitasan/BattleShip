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

    def valid_coordinate?(coordinate) #check to see if value exists in hash 
        @cells.key?(coordinate)
    end

    def same_length?(name, coordinates)
        @coordinates.length == @ship.length 
    end 

    def consecutive?
        #coordinates.each_cons
    end

    def diagonal? #coordinates cannot be diagonal 
    end 

    #name = Ship object, and array of Coords 
    def valid_placement?(name, coordinates) 
        #same_length? && consecutive? && diagonal tests must pass before we can do this one. 
    end

end 


board = Board.new
p board.create_cells
