<<-PROBLEM

The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?

PROBLEM

# This solution will work for small values of k (<= 5k) before stack overflow.

# Possible corrections / optimizations:
# => Iterative approach using hash to store values in sequence.
# => Binary Search with segmented increases to find correct value.

fibonacci = Hash.new{ |h,k| h[k] = k < 2 ? k : h[k-1] + h[k-2] }

(0..Float::INFINITY).each do |n|
  (puts "Answer = #{n}"; break)  if fibonacci[n].to_s.length >= 1000
end
