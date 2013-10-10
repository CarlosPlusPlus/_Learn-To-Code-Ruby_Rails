# Problem 20
# Factorial Digit Sum

def factorial(num)
	(1..num).inject(:*)
end

def digit_sum(num)
	num.to_s.split("").inject(0){|sum,n| sum + n.to_i}
end

puts "Digit sum of 100! = #{digit_sum(factorial(100))}"