require './lib/cell'

class Board
    attr_reader :cells, :column, :row

    def initialize
        @cells =       #refactor?
            {
                "A1" => Cell.new("A1"),
                "A2" => Cell.new("A2"),
                "A3" => Cell.new("A3"),
                "A4" => Cell.new("A4"),
                "B1" => Cell.new("B1"),
                "B2" => Cell.new("B2"),
                "B3" => Cell.new("B3"),
                "B4" => Cell.new("B4"),
                "C1" => Cell.new("C1"),
                "C2" => Cell.new("C2"),
                "C3" => Cell.new("C3"),
                "C4" => Cell.new("C4"),
                "D1" => Cell.new("D1"),
                "D2" => Cell.new("D2"),
                "D3" => Cell.new("D3"),
                "D4" => Cell.new("D4"),
            }
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
