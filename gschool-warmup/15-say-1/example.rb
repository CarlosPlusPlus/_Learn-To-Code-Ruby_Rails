class Say

  attr_reader :value
  def initialize(value)
    @value = value
  end

  def in_english
    guard_range
    say_small_number || say_big_number
  end

  private

  def say_small_number
    small_numbers[value]
  end

  def say_big_number
    s = decades[tens]
    unless ones.zero?
      s << "-#{small_numbers[ones]}"
    end
    s
  end

  def guard_range
    unless in_range?
      message = 'Number must be between 0 and 99, inclusive.'
      raise ArgumentError.new(message)
    end
  end

  def in_range?
    value >= 0 && value < 100
  end

  def tens
    @tens ||= value / 10
  end

  def ones
    @ones ||= value % 10
  end

  def small_numbers
    %w(zero one two three four five
       six seven eight nine ten
       eleven twelve thirteen fourteen fifteen
       sixteen seventeen eighteen nineteen)
  end

  def decades
    [nil, nil] +
    %w(twenty thirty forty fifty
       sixty seventy eighty ninety)
  end

end

require 'minitest/autorun'

class SayTest < MiniTest::Unit::TestCase
  def test_zero
    assert_equal 'zero', Say.new(0).in_english
  end

  def test_one
    assert_equal 'one', Say.new(1).in_english
  end

  def test_fourteen
    # If your algorithm says 'ten-four'
    # you're doing it wrong
    assert_equal 'fourteen', Say.new(14).in_english
  end

  def test_twenty
    # This really shouldn't be twenty-zero
    assert_equal 'twenty', Say.new(20).in_english
  end

  def test_twenty_two
    assert_equal 'twenty-two', Say.new(22).in_english
  end

  def test_lower_bound
    assert_raises ArgumentError do
      Say.new(-1).in_english
    end
  end

  def test_upper_bound
    assert_raises ArgumentError do
      Say.new(100).in_english
    end
  end
end
