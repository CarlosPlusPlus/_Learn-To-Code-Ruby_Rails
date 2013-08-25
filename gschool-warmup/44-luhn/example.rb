class Luhn

  def self.create(number)
    test_number = number * 10
    luhn = Luhn.new(test_number)
    return test_number if luhn.valid?
    test_number + 10 - (luhn.checksum % 10)
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def check_digit
    number % 10
  end

  def addends
    numbers = []
    number.to_s.reverse.split("").map(&:to_i).each_with_index do |n, i|
      value = i.even? ? n : n * 2
      value -= 9 if value > 9
      numbers << value
    end
    numbers.reverse
  end

  def checksum
    addends.inject(0, :+)
  end

  def valid?
    checksum % 10 == 0
  end
end
