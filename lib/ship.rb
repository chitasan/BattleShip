class Ship

  attr_reader :name, :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def health
    #related to length until hit
  end

  def sunk?
    if health = 0
      true
    else
      false
    end
  end

  def hit
    # when hit +1 health -1
  end

end
