class Scrabble
  def self.score(word)
    word.downcase.chars.inject(0) do |sum, letter|
      sum + value(letter)
    end
  end

  def self.value(letter)
    values.each do |key, points|
      return key if points.include?(letter)
    end
  end

  def self.values
    {
      1 => %w(a e i o u l n r s t),
      2 => %w(d g),
      3 => %w(b c m p),
      4 => %w(f h v w y),
      5 => %w(k),
      8 => %w(j x),
      10 => %w(q z),
    }
  end
end

