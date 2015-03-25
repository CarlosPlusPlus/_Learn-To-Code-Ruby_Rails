<<-PROBLEM

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

PROBLEM

def triple?(a,b,c)
  a**2 + b**2 == c**2
end

def solve
  max = 997

  (1..max).each do |a|
    ((a + 1)..max).each do |b|
      ((b + 1)..max).each do |c|
        return a,b,c if (triple?(a,b,c) && (a + b + c == 1000))
      end
    end
  end

  'oops'
end

a,b,c = solve
puts "a: #{a}, b: #{b}, c: #{c}"
puts "Solution: #{a * b * c}"
