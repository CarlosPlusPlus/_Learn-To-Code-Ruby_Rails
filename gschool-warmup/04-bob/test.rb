require 'minitest/autorun'
require 'minitest/pride'

ENV["RUBY_ENV"] = "test"

require './bob'

class BobOutputTest < MiniTest::Unit::TestCase
  def setup
    @bob = Bob.new
  end

  def test_shouting
    response = 'Woah, chill out!'
    assert_equal(response, @bob.response_for('SHOUTING'))
  end

  def test_question
    skip
    response = 'Sure.'
    assert_equal(response, @bob.response_for('a question?'))
  end

  def test_statement
    skip
    response = 'Whatever.'
    assert_equal(response, @bob.response_for('a statement.'))
  end

  def test_default
    skip
    response = 'Fine, be that way.'
    assert_equal(response, @bob.response_for(''))
  end

end

class BobInputTest < MiniTest::Unit::TestCase

  def setup
    @bob = Bob.new
  end

  # Testing tip: The methods below seem to only be used privately,
  # may want to remove them if the implementation is likely to change.
  def test_check_to_see_if_the_input_ends_with_a_?
    skip
    assert_equal(true, @bob.question?('Hello?'))
  end

  def test_have_have_a_string_input_longer_than_0
    skip
    assert_equal(true, @bob.statement?('At least 1'))
  end

  def test_have_all_uppercase_characters
    skip
    assert_equal(true, @bob.shouting?('HELLO'))
  end

end