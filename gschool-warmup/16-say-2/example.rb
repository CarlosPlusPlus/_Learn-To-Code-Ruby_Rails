class Say

  ONE_BILLION = 10**9
  ONE_MILLION = 10**6

  attr_reader :value
  def initialize(value)
    @value = value
  end

  def chunks
    guard_range

    billions, i = chop(value, ONE_BILLION)
    millions, i = chop(i, ONE_MILLION)
    thousands, i = chop(i, 1000)
    [billions, millions, thousands, i]
  end

  private

  def guard_range
    unless in_range?
      message = 'Number must be between 0 and 999,999,999,999 inclusive.'
      raise ArgumentError.new(message)
    end
  end

  def in_range?
    value >= 0 && value < 10**12
  end

  def chop(number, location)
    [number / location, number % location]
  end
end

require 'minitest/autorun'

class SayTest < MiniTest::Unit::TestCase
  def test_0
    assert_equal [0, 0, 0, 0], Say.new(0).chunks
  end

  def test_100
    assert_equal [0, 0, 0, 100], Say.new(100).chunks
  end

  def test_1_thousand
    assert_equal [0, 0, 1, 0], Say.new(1000).chunks
  end

  def test_1_thousand_234
    assert_equal [0, 0, 1, 234], Say.new(1234).chunks
  end

  def test_1_million
    assert_equal [0, 1, 0, 0], Say.new(10**6).chunks
  end

  def test_1_million_and_some_crumbs
    assert_equal [0, 1, 0, 2], Say.new(1000002).chunks
  end

  def test_1_million_2_thousand_345
    assert_equal [0, 1, 2, 345], Say.new(1002345).chunks
  end

  def test_1_billion
    assert_equal [1, 0, 0, 0], Say.new(10**9).chunks
  end

  def test_really_big_number
    assert_equal [987, 654, 321, 123], Say.new(987654321123).chunks
  end

  def test_lower_bound
    assert_raises ArgumentError do
      Say.new(-1).chunks
    end
  end

  def test_upper_bound
    assert_raises ArgumentError do
      Say.new(1000000000000).chunks
    end
  end
end
