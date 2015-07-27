#binary tree implementation for www.theodinproject.com
class Node
  attr_accessor :parent_node, :left_child, :right_child, :value
  include Comparable

  def initialize(value, parent_node = nil, left_child = nil, right_child = nil)
    @value = value
    @parent_node = parent_node
    @left_child = left_child
    @right_child = right_child
  end

  def <=> (other)
    if other.class == Node
      @value <=> other.value
    elsif other.class ==  Fixnum
      @value <=> other
    end
  end

  def to_s
    str = ""
    str += "< Node: @value: #{@value}\n"
    str += @parent.nil? ? "\t@parent: Nil\n" : "\t@parent: #{@parent.value}\n"
    str += @left_child.nil? ? "\t@left_child: Nil\n" : "\t@left_child: #{@left_child.value}\n"
    str += @right_child.nil? ? "\t@right_child: Nil>" : "\t@right_child: #{@right_child.value}>"
    str
  end

  def connected_nodes
    [@parent_node, @left_child, @right_child]
  end
end

def depth_first_search(master_node)
  visited = [master_node]
  stack = [master_node]

  while stack
    current_node = stack[-1]
    possible_nodes = current_node.connected_nodes
    lowest_node = 0
    possible_nodes.each do |node|
      if node && lowest_node && node < lowest_node
        lowest_node = node
      end
    end
  end
end

def find_parent(node, parent_node)
  puts "node: #{node}"
  puts "parent_node: #{parent_node}"
  if parent_node > node
    return parent_node unless parent_node.left_child  
    find_parent(node, parent_node.left_child)
  elsif parent_node <= node
    return parent_node unless parent_node.right_child 
    find_parent(node, parent_node.right_child)
  end
end

def assign_parent_and_child_node(new_node, parent_node)
  if parent_node > new_node
    parent_node.left_child = new_node
  elsif parent_node <= new_node
    parent_node.right_child = new_node
  end
end

def build_tree(array)
  master_node = Node.new(array.slice!(0))
  array.each do |node|
    node = Node.new(node)
    parent_node = find_parent(node, master_node)
    assign_parent_and_child_node(node, parent_node)
    puts parent_node
  end
  master_node
end

build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])