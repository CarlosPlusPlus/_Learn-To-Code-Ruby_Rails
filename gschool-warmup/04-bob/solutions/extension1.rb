class Bob
  def chat(input)
    puts response_for(input)
  end

  def response_for(input)
    if shouting?(input)
      'Woah, chill out!'
    elsif question?(input)
      'Sure.'
    elsif leet?(input)
      LeetString.new(input).to_s
    elsif statement?(input)
      'Whatever.'
    else
      'Fine, be that way.'
    end
  end

  def statement?(input)
    input.length > 0
  end

  def question?(input)
    input.end_with?("?")
  end

  def shouting?(input)
    !input.empty? && input == input.upcase
  end

  def leet?(input)
    input.start_with?("Bro,")
  end
end

class LeetString < String
  # Create a string representation of this object. This caches the result
  # of building the leet version of the string.
  def to_s
    # to_s is a common function on all objects. Normally, if you don't provide
    # this function we will instead use Object.to_s which uses the objects
    # location in memory and class name. "#<Object:0x007fda6393a630>"
    # to_s is called any time you `puts` or `inspect` an object.

    # Cache this building process using a "guarded assignment". This will
    # ensure that the leet version only gets built once for each object.
    return @leet ||= build_leet_string
  end

  # Build the leet version of a string.
  def build_leet_string
    # Duplicate self so that these destructive methods don't destroy
    # the integrity of the object. We would prefer to use the non-bang
    # methods and chain them together, but the line would be too long.
    # @see build_leet_string_non_bang
    ret = self.dup

    # Strip the preceeding "Bro, "
    ret.gsub!(/^Bro,\ ?/, '')
    # Force the string to be lowercased
    ret.downcase!
    # Change the vowels to numbers
    ret.gsub!(/[aeio]/, "a" => 4, "e" => 3, "i" => 1, "o" => 0)
    # Alternate case for consonants
    ret.alternate_case!

    return ret
  end

  # Build the leet version of a string without using self-modifying methods.
  def build_leet_string_non_bang
    # This form works, but the style is a little gross because the periods
    # are easy to screw up, the indenting is non-obvious, and while it's not
    # explicitly banned in bbatsov's style guide, he does say that
    # "multiline chaining is always ugly".
    return self.dup.
      # Strip the preceeding "Bro, "
      gsub(/^Bro,\ ?/, '').
      # Force the string to be lowercased
      downcase.
      # Change the vowels to numbers
      gsub(/[aeio]/, "a" => 4, "e" => 3, "i" => 1, "o" => 0).
      # Alternate case for consonants
      alternate_case
  end

  # Alternate case between up/downcase for any consecutive sequence of
  # consonants or the letters u or y. This modifies self.
  # Example:
  # "hello".alternate_case! #=> "helLo"
  # "bbb4bbb".alternate_case #=> "bBb4bBb"
  # "BBB".alternate_case #=> "BbB"
  # @see alternate_case
  def alternate_case!
    # Since this is descending from string, we can define new methods here
    # and use them like we would gsub! or downcase!. I've chosen to use a
    # self-modifying form to match the above style.

    # Storage variables
    ret = "" # This time use a normal String
    previous_char = ""

    # Go through each character and upcase it if the previous character
    # was a lower-case consonant
    self.each_char do |char|
      if previous_char =~ /[b-df-hj-np-z]/
        char.upcase!
      end
      ret << char
      previous_char = char
    end

    # Use a destructive method already in String to replace self. We can't
    # just do `self = ret` because of a SyntaxError.
    return self.replace(ret)
  end

  # Alternate case between up/downcase for any consecutive sequence of
  # consonants or the letters u or y.
  # @see alternate_case!
  def alternate_case
    return self.dup.alternate_case!
  end
end

if ENV["RUBY_ENV"] == "test"
else
  puts "Hey bro, wassup?"
  bob = Bob.new
  while true
    input = gets.chomp.strip
    bob.chat(input)
  end
end