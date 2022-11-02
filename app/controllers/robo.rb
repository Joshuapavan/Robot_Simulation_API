class Robo
  attr_accessor :x, :y, :direction, :command

  ROBOT_DIRECTIONS = ["north", "east", "south", "west"]
  ROBOT_COMMANDS = ["place", "move", "right", "left", "report"]

  def initialize()
    @board = Board.new(5, 5)
  end

  def is_valid_coordinates(x,y)
    if ((x.is_a? Integer and x <= @board.x) and ( y.is_a? Integer and y <= @board.y))
      return true
    else
      return false
    end
  end

  def is_valid_direction(direction)
    if (ROBOT_DIRECTIONS.include? direction)
      return true
    else
      return false
    end
  end

  def is_valid_command(command)
    if (ROBOT_COMMANDS.include? command)
      return true
    else
      return false
    end
  end

  def place_robot(x,y,direction)
    if (is_valid_coordinates(x,y) and is_valid_direction(direction))
      @x = x
      @y = y
      @direction = direction
    else
      raise TypeError "Invaid data sent as coordinates"
    end
  end

  def move_robot(x,y,direction)
    case direction
    when "north"
      to_move_x = 0
      to_move_y = 1
    when "east"
      to_move_x = 1
      to_move_y = 0
    when "south"
      to_move_x = 0
      to_move_y = -1
    when "west"
      to_move_x = -1
      to_move_y = 0
    end

    if (is_valid_coordinates(x + to_move_x , y + to_move_y))
      @x = x + to_move_x
      @y = y + to_move_y
    else
      raise ArgumentError "Unable to move the robot"
    end
  end

  def rotate_left()
    if !(@direction.nil?)
      index = ROBOT_DIRECTIONS.index(@direction)
      @direction = ROBOT_DIRECTIONS.rotate(-1)[index]
      return true
    else
      return false
    end
  end


  def rotate_right()
    if !(@direction.nil?)
      index = ROBOT_DIRECTIONS.index(@direction)
      @direction = ROBOT_DIRECTIONS.rotate()[index]
      return true
    else
      return false
    end
  end


  def execute_command(x,y,direction,command)
    @command = command
    case @command.downcase
    when "place"
      place_robot(x, y,direction)
    when "move"
      move_robot(x,y,direction)
    when "left"
      rotate_left()
    when "right"
      rotate_right()
    else
      raise ArgumentError, 'Invalid command'
    end
  end

end
