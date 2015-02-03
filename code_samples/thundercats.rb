class Cat
  CATS = []

  attr_reader :name

  def initialize(name='Snarf')
    raise 'Cannot have more than 10 cats in Thundera!' if CATS.size >= 10
    @name = name
    CATS << self
  end

  def meow
    puts "#{name} says, 'Meow!'"
  end

  def self.all
    puts "Here are the cats I have in Thundera!"
    CATS.each { |cat| puts cat.inspect }
  end

  def self.count
    puts "The number of cats I have is: #{CATS.size}\n\n"
  end
end

c1 = Cat.new('Lion-O')
c1.meow
Cat.count

c2 = Cat.new('Tygra')
c2.meow
Cat.count

c3 = Cat.new('Panthro')
c3.meow
Cat.count

Cat.all

6.times { |i| Cat.new("Cheetara#{i+1}") }
Cat.count

c10 = Cat.new
c10.meow
Cat.count

Cat.all

puts "\nThe following should raise an error!\n\n"
Cat.new('Mumm-Ra')
