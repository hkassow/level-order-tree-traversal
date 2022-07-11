class Node
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

def level_order_traversal(root)
  array = []
  if root.nil?
    return array
  end
  queue = [root]
  while !queue.empty?
    first = queue.shift
    array.push(first.value)
    queue.push(first.left) if first.left != nil
    queue.push(first.right) if first.right != nil 
  end
  array
end

#returns array of tree values in order
def tree_traversal_inorder(root)
  #add values to array from a binary search tree inorder
  array = []  
  return array if root.nil?
  
  stack = [root]
  while !stack.empty?
    #top  => stack[-1]
    if ! stack[-1].left.nil? 
      #cut off left branch path
      #add left branch to top of stack
      #since left branches are smaller dont add any values to array
      left_sub = stack[-1].left
      stack[-1].left = nil
      stack.push(left_sub)
    else  
      #no left branch => smallest value now
      #remove it from stack
      #add it to array 
      popped = stack.pop
      array.push popped.value
      stack.push popped.right if ! popped.right.nil?
    end
  end
  array
end

#searching a ordered bsc with comparable values
def find_target(root, target)
  if root.nil? 
    return nil
  elsif root.value == target 
    return root
  elsif (root.value < target) & (!root.right.nil?)
    return find_target(root.right, target)
  elsif (root.value > target) & (!root.left.nil?)
    return find_target(root.left, target)
  else
    return nil
  end
end

