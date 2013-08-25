# Problem 4
# Largest palindrome product

def palindrome?(num)
  str = num.to_s

  len = str.length
  mid = (len / 2.0).ceil

  for i in 0..mid
    return false if str[i] != str[len-1-i] 
  end

  true
end

# Return maximum palindrome for 3 digit #s.
def find_max_palindrome
  max_palindrome = 0
  
  (100..999).each do |i|
      (i..999).each do |j|
        prod = i*j
        max_palindrome = prod if (palindrome?(prod) && (prod > max_palindrome))
    end
  end

  max_palindrome
end

# Solve problem.

puts find_max_palindrome