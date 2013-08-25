require 'minitest/autorun'
require 'minitest/pride'

ENV["RUBY_ENV"] = "test"

require './extension1'

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

  def test_leet
    skip
    response = 'l33t sP34k 1s r4d'
    assert_equal(response, @bob.response_for('Bro, leet speak is rad'))
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

  def test_check_to_see_if_the_string_starts_with_bro
    skip
    assert_equal(true, @bob.leet?('Bro, '))
  end
end

class LeetStringTest < MiniTest::Unit::TestCase
  def test_vowel_transformations
    skip
    # String slightly out of order to prevent testing alternating case logic
    test_string = LeetString.new("aeiuoy").to_s
    assert_equal("431u0y", test_string)
  end

  def test_bro_removal
    skip
    # String is odd to prevent testing other logic
    test_string = LeetString.new("Bro, 444").to_s
    assert_equal("444", test_string)
  end

  def test_first_char_is_downcase
    skip
    test_string = LeetString.new("B44").to_s
    assert_equal("b44", test_string)
  end

  def test_alternating_case
    skip
    test_string = LeetString.new("BBBBBBBBB").to_s
    assert_equal("bBbBbBbBb", test_string)
  end

  def test_alternating_case_after_number
    skip
    test_string = LeetString.new("BBB4BBB").to_s
    assert_equal("bBb4bBb", test_string)
  end

  def test_cache_doesnt_make_string_immutable
    skip
    test_string = LeetString.new("BBB4BBB").to_s
    test_string.replace("CCC4CCC")
    assert_equal("cCc4cCc", test_string.to_s)
  end
end
