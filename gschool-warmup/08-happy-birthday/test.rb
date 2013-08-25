require 'date'
require 'minitest/autorun'
require 'minitest/mock'
require_relative './example'

class HappyBirthdayTest < MiniTest::Unit::TestCase

  def test_birthday_coming_up
    birthday = HappyBirthday.new(Date.new(2013, 2, 7))
    assert_equal 32, birthday.age(1980, 3, 14)
  end

  def test_birthday_past
    birthday = HappyBirthday.new(Date.new(2013, 3, 14))
    assert_equal 33, birthday.age(1980, 2, 7)
  end

  def test_ask_returns_a_number
    birthday = HappyBirthday.new
    def birthday.print(s)
    end
    birthday.stub(:gets, "42\n") do
      assert_equal 42, birthday.ask("What is the answer?")
    end
  end
end
