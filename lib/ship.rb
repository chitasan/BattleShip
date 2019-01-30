class Ship

  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    @length
  end

  def sunk? #refactor method: changed if statement to boolean 
    @health == 0
  end

  def hit
    @health -= 1
  end

end
