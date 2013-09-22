# Problem 14
# Longest Collatz Sequence

class Collatz
	Sums = {}

	def self.compute_sequence(num,count=1)
		if num == 1
			Sums[num] = count
			return count
		end

		return (count + Sums[num]) if Sums[num]

		num.even? ? compute_sequence(num/2,count+1) : compute_sequence(3*num+1,count+1)
	end

	def self.sums
		Sums
	end
end

#################
# Solve Problem #
#################

max_val = [-1,-1]

(1..1E6).each do |n|
	count = Collatz.compute_sequence(n)
	max_val = [n,count] if max_val[1] < count
end

puts "Maximum Collatz sequence: n = #{max_val[0]}, count = #{max_val[1]}"