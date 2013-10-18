# Spoiler alert
# This file, like all the example.rb files in this repo, is designed
# to be a place where you can check your answer or see another style.









































# try: `diff -u example.rb solutions/extension1.rb`
class Beer
  def self.song(initial_bottles=99)
    # 99.downto(2) #=> [99, 98, 97, ... , 3, 2]
    # We only go downto 2 because the last line is special
    initial_bottles.downto(2) do |i|
      puts verse(i)
      puts "" # extra newline
    end
    puts last_verse()
  end

  def self.verse(num_bottles)
    return <<-eos
#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer.
Take one down and pass it around, #{num_bottles-1} #{pluralize(num_bottles-1)} of beer on the wall.
    eos
  end

  def self.last_verse
    return <<-eos
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    eos
  end

  def self.pluralize(num_bottles)
    return "bottles" if num_bottles != 1
    return "bottle"
  end
end

# Reopen the Fixnum class to add an instance method. This is a terrible
# practice but it's very useful to know that it's possible. This is
# called Monkey Patching. In Ruby 2.x there will be a much safer way
# of doing this called Refinements but this is still being worked on.
class Fixnum
  def bottles_of_beer
    Beer.song(self)
  end
end