require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'


class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_that_cells_attribute_and_is_a_hash

    board = Board.new

    assert_equal Hash, board.cells.class
    #assert_equal 16, board.cells.keys.length -- cannot test till as actual = 0
  end

    board = Board.new

    assert_equal Hash, board.cells.class
    #assert_equal 16, board.cells.length -- cannot test till as actual = 0
  end

  def test_it_has_16_cells_with_key_value_pair
    board = Board.new

    assert_equal 16, board.create_cells.keys.length
    assert_equal 16, board.create_cells.values.length 
  end 
 
  # def test_key_value_points_to_cell_objects #do i test for this? how? 
  #   board = Board.new

  #   assert_equal expected, actual 
  # end 




  # def test_coordinates_are_valid
  #   board = Board.new

  #   assert board.valid_coordinate?("A1") 
  #   assert board.valid_coordinate?("D4")
  # end

  # def test_coordinates_valid 
  #   board = Board.new

  def test_coordinates_not_valid 
    board = Board.new

  
  #   refute board.valid_coordinate?("A5")
  #   refute board.valid_coordinate?("E1")
  #   refute board.valid_coordinate?("A22")
  # end


  # def test_if_coordinates_and_ship_are_same_length
  #   skip
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)

    

  #   refute board.same_length?(cruiser, ["A1", "A2"])
  #   assert board.same_length?(cruiser, ["A1", "A2", "A3"])
  #   refute board.same_length?(submarine, ["A1", "A2", "A3"])
  #   assert board.same_length?(submarine, ["A1", "A2"])
  # end 

  # def test_if_coordinates_are_consecutive


  #   refute board.valid_placement?(cruiser, ["A1", "A2", "A4"])
  #   refute board.valid_placement?(submarine, ["A1", "C1"])
  #   refute board.valid_placement?(cruiser, ["A3", "A2", "A1"])
  # end

  # def test_if_coordinates_are_diagonal
  # end 

  def test_if_coordinates_and_ship_are_same_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.same_length?(cruiser, ["A1", "A2"])
    assert board.same_length?(cruiser, ["A1", "A2", "A3"])
    refute board.same_length?(submarine, ["A1", "A2", "A3"])
    assert board.same_length?(submarine, ["A1", "A2"])
  end 

  def test_if_coordinates_are_consecutive
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    refute board.valid_placement?(submarine, ["A1", "C1"])
    refute board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    refute board.valid_placement?(cruiser, ["C1", "B1"])
  end

  def test_if_coordinates_are_diagonal
    skip
  end 


  # def test_if_placements_are_valid 
  #   skip
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)

  #   refute board.valid_placement?(cruiser, ["A1", "A2"])
  #   refute board.valid_placement?(submarine, ["A2", "A3", "A4"])
  # end
 

  # def test_placements_are_not_valid #this test is the refute assertion in the test above 
  # end

  def test_placements_are_not_valid
    skip #this test is the refute assertion in the test above 
  end


end
