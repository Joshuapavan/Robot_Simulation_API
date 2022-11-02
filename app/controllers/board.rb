class Board
  attr_accessor :x , :y

  def initialize(x,y)
    if (x.is_a? Integer and y.is_a? Integer)
      @x = x
      @y = y
    else
      raise TypeError, "Invalid X and Y co-ordinates"
    end
  end
end
