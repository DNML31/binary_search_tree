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
    @root = build_tree(array, 0, array.length - 1)
  end

  def build_tree(array, first, last)
    array.sort!.uniq # sort and remove duplicates
  
    if first > last
      return nil
    end

    mid = (first + last) / 2
    mid_node = Node.new(array[mid])

    build_tree(array, first, mid - 1)
    build_tree(array, mid + 1, last)

    return mid_node.value
  end

  def insert(value)

    if value == @root
      puts "can't have duplicate value"
    end

    if value < @root
      # find root of left subtree...
      # go down left subtree
    else
      # find root of right subtree
      # go down right subtree
    end

  end

end


array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# 1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345
tree = Tree.new(array)
# create a Tree object with the given array

tree.build_tree(array, 0, array.length - 1)

puts tree.insert(7)

