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

  def smallest_node(root = @root.right)
    current = root
    while current != nil && current.left != nil
      current = current.left
    end
    current.value
  end

  def delete(value, root = @root)

    return root if root.nil?

    if value < root.value
      root.left = delete(value, root.left)
    elsif value > root.value
      root.right = delete(value, root.right)
    else
      # case 1 - no child
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      # case 2 - one child
      if root.left.nil?
        temp = root
        root = root.right
        temp = nil
      elsif root.right.nil?
        temp = root
        root = root.left
        temp = nil
      end

      # case 3 - two children
      temp = smallest_node(root.right)
      root.value = temp
      root.right = delete(temp, root.right)

    end

    root

  end

  def find(value, root = @root)
    puts root
    if root == nil
      puts "value doesn't exist"
    elsif root == value
      root
    elsif value < root.value
      find(value, root.left)
    elsif value > root.value
      find(value, root.right)
    end
  end

  def level_order(root = @root, queue = [], array = [])
    if !root.nil? && !queue.any?(root)
      queue.push(root)
    elsif root.nil?
      return
    end
    # print queue
    queue.push(root.left) if !root.left.nil?
    queue.push(root.right) if !root.right.nil?

    node = queue.shift
    array.push(node.value)

    print array if queue.none?
    level_order(queue[0], queue, array)

  end


end


array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# 1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345
# if it is sorted and no duplicates

# array = [0,1,2,3,4]

tree = Tree.new(array)
tree.build_tree(array)
# tree.insert(124)
# puts tree.find(8)
# tree.delete(4)
tree.level_order

# tree.pretty_print