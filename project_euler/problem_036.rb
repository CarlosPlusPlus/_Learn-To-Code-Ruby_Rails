<<-PROBLEM

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
(Please note that the palindromic number, in either base, may not include leading zeros.)

PROBLEM

class String
  def palindrome?
    self == self.reverse
  end
end

def is_double_palindrome?(n)
  n.to_s.palindrome? && n.to_s(2).palindrome?
end

solution = (1..999999).select { |n| is_double_palindrome?(n) }.inject(:+)
puts "Sum of all numbers < 1E6 which are palindromic in B10 & B2 = #{solution}"
