require 'pry'
class Triangle
  # write code here
  attr_reader :kind
  def initialize(side1, side2, side3)
    sides = [side1, side2, side3]
    sides.each{|side|
      no_side = side <= 0
      triangle_inequality = (sides.inject(0, :+) - side) > side
      raise TriangleError if !triangle_inequality || no_side
    }
    case sides.uniq.length
    when 1
      @kind = :equilateral
    when 2
      @kind = :isosceles
    when 3
      @kind = :scalene
    end
  end
  
  class TriangleError < StandardError
  end
end
