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

    if root.nil?
      return nil
    elsif root.value > value
      root.left = Node.new(value) if root.left.nil?
      insert(value, root.left)
    elsif root.value < value
      root.right = Node.new(value) if root.right.nil?
      insert(value, root.right)
    end

  end

  def delete(value, root = @root)

    if root == nil
      root.value
    elsif value == root.value
      root.value = nil
    elsif value < root.value
      delete(value, root.left)
    elsif value > root.value
      delete(value, root.right)
    else

    end


  end
end


# array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# 1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345
# if it is sorted and no duplicates

array = [1,2]

tree = Tree.new(array)
tree.build_tree(array)
tree.pretty_print
# tree.insert(2)
tree.delete(2)
tree.pretty_print