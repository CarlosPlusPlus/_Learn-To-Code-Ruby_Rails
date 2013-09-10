# Problem 10
# Summation of Primes

require 'prime'

sum = 0

Prime.each(Float::INFINITY) do |prime|
	break if prime > 2E6;
	sum += prime
end

puts "Sum of all primes under 2 million = #{sum}"