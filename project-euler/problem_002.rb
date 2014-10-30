# Problem 2
# Multiples of 3 and 5

n1  = 1
n2  = 2
sum = 0

while (n1 <= 4E6 && n2 < 4E6)
  sum += n1 if n1.even?
  sum += n2 if n2.even?

  n1 = n1 + n2
  n2 = n1 + n2
end

puts "Sum = #{sum}"
