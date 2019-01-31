class Ship

  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length 
  end

  def sunk?
    @health <= 0 #changed to less or equal to; do we test for negative health? 
  end

  def hit 
    @health -= 1
  end
end