class Grandma
  def speak_up
    "HUH?!  SPEAK UP, SONNY!"
  end

  def no
    "NO, NOT SINCE #{1930 + rand(20)}."
  end

  def bye
    'BYE, NOW.'
  end

  def done?
    @bye == 3
  end

  def track_byes(s)
    @bye ||= 0
    if s == 'BYE'
      @bye += 1
    else
      @bye = 0
    end
  end

  def response(s)
    track_byes s
    if done?
      bye
    elsif s.empty? || s.upcase != s
      speak_up
    else
      no
    end
  end

  def talk
    begin
      puts response(gets.chomp)
    end until done?
  end
end

require 'minitest/autorun'
class GrandmaTest < MiniTest::Unit::TestCase

  def setup
    @grandma = Grandma.new
  end

  def test_response_to_silence
    assert_equal @grandma.speak_up, @grandma.response("")
  end

  def test_response_to_normal_tone
    assert_equal @grandma.speak_up, @grandma.response("Hi, Grandma.")
  end

  def test_response_to_shouting
    assert_match /NO, NOT SINCE/, @grandma.response("DO YOU WANT COFFEE?")
  end

  def test_bye_once
    assert !@grandma.done?, @grandma.response("BYE")
  end

  def test_bye_non_consecutive
    @grandma.response("BYE")
    @grandma.response("BYE")
    @grandma.response("MOM WILL VISIT YOU ON SUNDAY")
    @grandma.response("BYE")
    assert !@grandma.done?
  end

  def test_bye_consecutive
    @grandma.response("BYE")
    @grandma.response("BYE")
    @grandma.response("BYE")
    assert @grandma.done?
  end

  def test_goodbye
    @grandma.response("BYE")
    @grandma.response("BYE")
    assert_equal @grandma.bye, @grandma.response("BYE")
  end
end

Grandma.new.talk
