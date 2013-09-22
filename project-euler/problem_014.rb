# Problem 14
# Longest Collatz Sequence

class Collatz
	Sums = {}

	def self.compute_sequence(num,count)
		
		return (count + Sums[num]) if Sums[num]
		
		if num == 1
			Sums[num] = count
			return count
		end

		num.even? ? compute_sequence(num/2,count+1) : compute_sequence(3*num+1,count+1)

	end
end

puts "Collatz value for 13 = #{Collatz.compute_sequence(13,1)}"