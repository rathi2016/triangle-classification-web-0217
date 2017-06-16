class Triangle
  attr_accessor :s1, :s2, :s3

  def initialize(a,b,c)
    @s1 = a
    @s2 = b
    @s3 = c
  end

  def kind
    validates_side
    if s1 == s2 && s2 == s3
      :equilateral
    elsif s1 == s2 || s2 == s3 || s1 == s3
      :isosceles
    else
      :scalene
    end
end
    def validates_side
      real_triangle = [(s1 + s2 > s3), (s1 + s3 > s2), (s2 + s3 > s1)]
      [s1, s2, s3].each { |s| real_triangle << false if s <= 0 }
      raise TriangleError if real_triangle.include?(false)
    end
  end



class TriangleError < StandardError
  def message
    "This is not a Triangle"
  end
end
