# Problem 4
# Largest palindrome product

def palindrome?(num)
  num.to_s == num.to_s.reverse
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

# Fin maximum palindrome within given range.
puts find_max_palindrome
