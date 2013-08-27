# Problem 6
# Sum Square Difference

def square_of_sum(max)
	(1..max).inject(:+)**2
end

def sum_of_squares(max)
	(1..max).inject(0) {|sum,num| sum + num**2 }
end


def sum_square_diff(max)
  square_of_sum(max) - sum_of_squares(max)
end

puts sum_square_diff(100)