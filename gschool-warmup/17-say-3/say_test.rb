require 'minitest/autorun'
require 'minitest/pride'
require_relative './say'

class SayTest < MiniTest::Unit::TestCase
  def test_0
    assert_equal '0', Say.new(0).in_english
  end

  def test_100
    assert_equal '100', Say.new(100).in_english
  end

  def test_1_thousand
    assert_equal '1 thousand', Say.new(1000).in_english
  end

  def test_1_thousand_234
    assert_equal '1 thousand 234', Say.new(1234).in_english
  end

  def test_1_million
    assert_equal '1 million', Say.new(10**6).in_english
  end

  def test_2_million_and_some_crumbs
    assert_equal '2 million 2', Say.new(2000002).in_english
  end

  def test_1_million_2_thousand_345
    assert_equal '1 million 2 thousand 345', Say.new(1002345).in_english
  end

  def test_1_billion
    assert_equal '1 billion', Say.new(10**9).in_english
  end

  def test_really_big_number
    expected = '987 billion 654 million 321 thousand 123'
    assert_equal expected, Say.new(987654321123).in_english
  end

  def test_lower_bound
    assert_raises ArgumentError do
      Say.new(-1).in_english
    end
  end

  def test_upper_bound
    assert_raises ArgumentError do
      Say.new(1000000000000).in_english
    end
  end
end
