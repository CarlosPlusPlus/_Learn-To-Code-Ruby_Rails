class Say

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def in_english
    unless number.between?(0, 1_000_000_000_000-1)
      raise ArgumentError.new "can't do that"
    end

    return "0" if number == 0

    s = ""
    s << "#{billions} billion" if billions > 0
    s << " #{millions} million" if millions > 0
    s << " #{thousands} thousand" if thousands > 0
    s << " #{hundreds}" if hundreds > 0
    s.strip
  end

  def hundreds
    @hundreds ||= number % 1_000
  end

  def thousands
    @thousand ||= number % 1_000_000 / 1000
  end

  def millions
    @millions ||= number % 1_000_000_000 / 1_000_000
  end

  def billions
    @billions ||= number / 1_000_000_000
  end
end
