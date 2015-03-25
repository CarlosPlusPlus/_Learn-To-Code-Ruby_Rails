# Problem 5
# Smallest multiple

def smallest_multiple(max)
  (1..max).inject(:lcm)
end

puts smallest_multiple(20)
