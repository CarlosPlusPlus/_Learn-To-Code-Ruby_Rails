a = ["t", 11, "h", 3, "x", 8]

puts "Array a = #{a}"

class Array
  def my_reverse
    return self if self.size == 1
    [self[-1]] + self[0...-1].my_reverse
  end
end

puts "Array Solution 1: #{a.my_reverse}"

class Array
  def my_reverse
    [].tap { |a| (self.size - 1).downto(0) { |i| a << self[i] }}
  end
end

puts "Array Solution 2: #{a.my_reverse}"

class Array
  def my_reverse
    self.inject([]) { |s,e| s.unshift(e) }
  end
end

puts "Array Solution 3: #{a.my_reverse}"

s = 'Hello World!'

class String
  def my_reverse
    self.split('').inject('') { |s,c| c + s }
  end
end

puts "String Solution: #{s.my_reverse}"