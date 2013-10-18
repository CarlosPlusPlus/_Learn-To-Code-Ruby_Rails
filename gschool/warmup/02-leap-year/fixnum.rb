class Fixnum

  def leap_year?
    by4 && (!by100 || by400)
  end

  private

  def by4
    (self % 4) == 0
  end

  def by100
    (self % 100) == 0
  end

  def by400
    (self % 400) == 0
  end

end

