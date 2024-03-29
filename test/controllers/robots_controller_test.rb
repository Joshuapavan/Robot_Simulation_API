require "test_helper"

class RobotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @robot = robots(:one)
  end

  test "should get index" do
    get robots_url, as: :json
    assert_response :success
  end

  test "should create robot" do
    assert_difference("Robot.count") do
      post robots_url, params: { robot: { command: @robot.command, direction: @robot.direction, x: @robot.x, y: @robot.y } }, as: :json
    end

    assert_response :created
  end

  test "should show robot" do
    get robot_url(@robot), as: :json
    assert_response :success
  end

  test "should update robot" do
    patch robot_url(@robot), params: { robot: { command: @robot.command, direction: @robot.direction, x: @robot.x, y: @robot.y } }, as: :json
    assert_response :success
  end

  test "should destroy robot" do
    assert_difference("Robot.count", -1) do
      delete robot_url(@robot), as: :json
    end

    assert_response :no_content
  end
end
