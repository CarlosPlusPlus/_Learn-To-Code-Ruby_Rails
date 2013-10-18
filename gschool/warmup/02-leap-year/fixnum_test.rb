require_relative './fixnum'
require 'minitest/autorun'

class FixnumTest < MiniTest::Unit::TestCase
  def test_vanilla_leap_year
    assert 1996.leap_year?
  end

  def test_any_old_year
    assert !1997.leap_year?
  end

  def test_century
    assert !1900.leap_year?
  end

  def test_exceptional_century
    assert 2000.leap_year?
  end

end

