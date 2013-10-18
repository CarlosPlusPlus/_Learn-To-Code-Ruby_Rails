class Sieve

  attr_reader :limit
  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes ||= calculate
  end

  private
  def calculate
    numbers = (2..limit).to_a
    primes = []
    begin
      target = numbers.shift
      primes << target
      numbers.reject! {|i| i % target == 0 }
    end until numbers.empty?
    primes
  end

end

