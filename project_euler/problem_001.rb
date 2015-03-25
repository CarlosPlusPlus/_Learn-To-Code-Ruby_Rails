# Problem 1
# Multiples of 3 and 5

sum = (1..999).select{|n| (n%3).zero? || (n%5).zero?}.inject(:+)

puts "The sum of all the multiples of 3 or 5 below 1000 is #{sum}."