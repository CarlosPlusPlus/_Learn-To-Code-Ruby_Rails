class Robot
  def name
    @name ||= "#{prefix}#{suffix}"
  end

  def reset
    @name = nil
  end

  private

  def prefix
    alphabet.shuffle[0..1].join('')
  end

  def suffix
    rand(899) + 100
  end

  def alphabet
    ('A'..'Z').to_a
  end
end

require 'minitest/autorun'
class RobotTest < MiniTest::Unit::TestCase
  def test_has_name
    assert_match /\w{2}\d{3}/, Robot.new.name
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    assert Robot.new.name != Robot.new.name
  end

  def test_reset_name
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    assert name != name2
  end
end
