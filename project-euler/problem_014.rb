# Problem 14
# Longest Collatz Sequence

class Collatz
  Sums = {}

  def self.compute_sequence(start,num,count=1)
    if num == 1
      Sums[start] = count if Sums[start].nil?
      return count
    end

    # Memoization of sequence if already discovered.
    if Sums[num]
      Sums[start] = (count + Sums[num] - 1) if Sums[start].nil?
      return (count + Sums[num] - 1)
    end

    num.even? ? compute_sequence(start,num/2,count+1) : compute_sequence(start,3*num+1,count+1)
  end
end

#################
# Solve Problem #
#################

max_val = [-1,-1]

(1..1E6).each do |n|
  count   = Collatz.compute_sequence(n,n)
  max_val = [n,count] if max_val[1] < count
end

puts "Maximum Collatz sequence: n = #{max_val[0]}, count = #{max_val[1]}"
