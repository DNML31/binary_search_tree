module Comparable
  def greater?(value_a, value_b)
    if value_a.value > value_b.value
      puts "#{value_a.value} is greater."
    else
      puts "#{value_b.value} is greater."
    end
  end
end

class Node
  include Comparable

  attr_accessor :value, :left_sub, :right_sub

  def initialize(value, left = nil, right = nil)
    @value = value
    @left_sub = left
    @right_sub = right
  end

end






class Tree
  attr_accessor :root
  def initialize(array)
    @array = array

  end

  def build_tree(array)
    array.sort!.uniq

    # first = 0
    # last = array.length - 1
    # mid = (first + last) / 2

    first = Node.new(array[0]) 
    puts first.value
    last = Node.new(array[array.length - 1])
    puts last.value
    mid = Node.new(array[(0 + array.length - 1) / 2])
    puts mid.value

    # values < mid become left sub array
    # values > mid become right sub array

    # do these steps recursively

    # need to construct a balanced binary tree of Nodes
    # needs to return root node
  end

end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
