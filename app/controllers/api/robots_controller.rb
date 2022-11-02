class Api::RobotsController < ApplicationController
  before_action :set_robot, only: %i[ show update destroy report]

  # GET /robots
  def index
    @robots = Robot.all
    render json: @robots
  end

  # GET /robots/1
  def show
    render json: @robot
  end

  # POST /robots
  def create
    x = params[:x].to_i
    y = params[:y].to_i
    direction = params[:direction].to_s.downcase
    command = params[:command].to_s.downcase
    robo = Robo.new()

    robo.execute_command(x,y,direction,command)

    @robot = Robot.create(x: robo.x,y: robo.y,direction: robo.direction,command: robo.command)

    if @robot.save
      render json: @robot, status: :created
    else
      render json: @robot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /robots/1
  def update
    x = params[:x].to_i
    y = params[:y].to_i
    direction = params[:direction].to_s.downcase
    command = params[:command].to_s.downcase

    robo = Robo.new()
    robo.execute_command(x,y,direction,command)

    if @robot.update(x: robo.x,y: robo.y,direction: robo.direction,command: robo.command)
      render json: @robot, staus: "Robot moved"
    else
      render json: @robot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /robots/1
  def destroy
    @robot.destroy
  end

  def report
    x = @robot.x
    y = @robot.y
    direction = @robot.direction
    command = "report"

    robo = Robo.new()

    if ((x.nil? and y.nil?) or direction.nil?)
      render plain: "error with fecthing coordinates, the postion or direction is empty"
    else
      render plain: "Co-ordinates: x = #{x}, y = #{y}, Direction : #{direction.to_s}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot
      @robot = Robot.find(params[:id])
    end
end
