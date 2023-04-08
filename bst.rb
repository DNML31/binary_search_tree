class Node
  include Comparable

  attr_accessor :value, :left_sub, :right_sub

  def initialize(value, left = nil, right = nil)
    @value = value
    @left_sub = left
    @right_sub = right
  end

end


module Comparable
  def greater?(value_a, value_b)
    if value_a.value > value_b.value
      puts "#{value_a.value} is greater."
    else
      puts "#{value_b.value} is greater."
    end
  end
end




class Tree

end

dan = Node.new(10)
steve = Node.new(6)

puts dan.greater?(dan, steve)