# Spoiler alert
# This file, like all the example.rb files in this repo, is designed
# to be a place where you can check your answer or see another style.









































# try: `diff -u solutions/extension1.rb solutions/extension2.rb`
class Beer
  def self.song(initial_bottles=99, drink="beer")
    # 99.downto(2) #=> [99, 98, 97, ... , 3, 2]
    # We only go downto 2 because the last line is special
    initial_bottles.downto(2) do |i|
      puts verse(i, drink)
      puts "" # extra newline
    end
    puts last_verse(drink)
  end

  def self.verse(num_bottles, drink)
    return <<-eos
#{num_bottles} bottles of #{drink} on the wall, #{num_bottles} bottles of #{drink}.
Take one down and pass it around, #{num_bottles-1} #{pluralize(num_bottles-1)} of #{drink} on the wall.
    eos
  end

  def self.last_verse(drink)
    return <<-eos
1 bottle of #{drink} on the wall, 1 bottle of #{drink}.
Take it down and pass it around, no more bottles of #{drink} on the wall.

No more bottles of #{drink} on the wall, no more bottles of #{drink}.
Go to the store and buy some more, 99 bottles of #{drink} on the wall.
    eos
  end

  def self.pluralize(num_bottles)
    return "bottles" if num_bottles != 1
    return "bottle"
  end
end

# Reopen Fixnum again, and redefine bottles_of_beer to use the more flexible
# `bottles_of` method. Note how you can use `bottles_of` before it's defined,
# this is called "hoisting".
class Fixnum
  def bottles_of_beer
    self.bottles_of("beer")
  end
  def bottles_of(drink="beer")
    Beer.song(self, drink)
  end
end