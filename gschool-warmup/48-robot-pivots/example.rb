class Robot

  attr_accessor :bearing

  def orient(direction)
    unless cardinal_directions.include?(direction)
      raise ArgumentError
    end
    self.bearing = direction
  end

  def turn_right
    turn(:+)
  end

  def turn_left
    turn(:-)
  end

  private

  def turn(sign)
    i = cardinal_directions.index(bearing)
    self.bearing = cardinal_directions[i.send(sign, 1) % 4]
  end

  def cardinal_directions
    [:north, :east, :south, :west]
  end

end
