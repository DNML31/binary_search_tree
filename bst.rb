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

  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

end

class Tree
  attr_accessor :root
  def initialize(array)
    array = array.sort!.uniq
    @root = build_tree(array, 0, array.length - 1)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def build_tree(array, first = 0, last = array.length - 1)

    if first > last
      return nil
    end

    mid = (first + last) / 2
    mid_node = Node.new(array[mid])

    mid_node.left = build_tree(array, first, mid - 1)
    mid_node.right = build_tree(array, mid + 1, last)

    return mid_node
  end

  def insert(value, root = @root)

    # case root
    # when value == root then return nil
    # when nil
    #   @root = Node.new(value)
    #   return
    # when root.value > value
    #   root = root.left
    #   insert(value)
    # when root.value < value
    #   root = root.right
    #   insert(value)
    # else
    #   return
    # end

    if @root == nil
      @root = Node.new(value)
    end

    if value == @root.value
      return nil
    end

    if value < @root.value
      if @root.value.nil?
        @root.value = Node.new(value)
      else
        @root = @root.left
      end

    elsif value > @root.value

      if @root.value.nil?
        @root.value = Node.new(value)
      else
        @root = @root.right
      end
      
    end

    insert(value, root = @root)

  end

end


# array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# 1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345
# if it is sorted and no duplicates

array = [1,2,4]

tree = Tree.new(array)
tree.build_tree(array)
tree.insert(3)

tree.pretty_print
