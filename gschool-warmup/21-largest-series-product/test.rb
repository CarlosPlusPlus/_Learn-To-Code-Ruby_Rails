require 'minitest/autorun'
require 'minitest/pride'
require_relative './series'

class SeriesTest < MiniTest::Unit::TestCase
  def test_digits
    assert_equal (0..9).to_a, Series.new("0123456789").digits
  end

  def test_slices_of_2
    skip
    series = Series.new("01234")
    expected = [[0, 1], [1, 2], [2, 3], [3, 4]]
    assert_equal expected, series.slices(2)
  end

  def test_slices_of_3
    skip
    series = Series.new("01234")
    expected = [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
    assert_equal expected, series.slices(3)
  end

  def test_largest_product_of_2
    skip
    series = Series.new("0123456789")
    assert_equal 72, series.largest_product(2)
  end

  def test_largest_product_of_a_tiny_number
    skip
    series = Series.new("12")
    assert_equal 2, series.largest_product(2)
  end

  def test_largest_product_of_2_shuffled
    skip
    series = Series.new("5768902143")
    assert_equal 72, series.largest_product(2)
  end

  def test_largest_product_of_3
    skip
    series = Series.new("0123456789")
    assert_equal 504, series.largest_product(3)
  end

  def test_largest_product_of_3_shuffled
    skip
    series = Series.new("1027893564")
    assert_equal 504, series.largest_product(3)
  end

  def test_largest_product_of_5
    skip
    series = Series.new("0123456789")
    assert_equal 15120, series.largest_product(5)
  end

  def test_some_big_number
    skip
    s = '73167176531330624919225119674426574742355349194934'
    series = Series.new(s)
    assert_equal 23520, series.largest_product(6)
  end

  def test_slices_bigger_than_number
    skip
    series = Series.new("123")
    assert_raises ArgumentError do
      series.largest_product(4)
    end
  end
end

