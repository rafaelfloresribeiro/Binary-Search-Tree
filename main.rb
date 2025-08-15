# frozen_string_literal: true

require 'pry-byebug'

# Node class for nodes
class Node
  attr_accessor :left, :right, :data

  include Comparable

  def initialize(value)
    @left = nil
    @right = nil
    @data = value
  end

  def insert(node)
    return if node.data == @data

    if node.data > @data
      if @right.nil?
        self.right = node
      else
        @right.insert(node)
      end
    elsif node.data < @data
      if @left.nil?
        self.left = node
      else
        @left.insert(node)
      end
    end
  end

  def delete(node)
    compare = @data
    if !left.nil? && node == @left.data
      if @left.childrens.zero?
        @left = nil
      elsif @left.childrens == 1
        @left = @left.snip
      end
    elsif !right.nil? && node == @right.data
      if @right.childrens.zero?
        @right = nil
      elsif @right.childrens == 1
        @right = @right.snip
      end
    elsif node < compare
      @left.delete(node)
    elsif node > compare
      @right.delete(node)
    end
  end

  def snip
    if @right
      something = @right
    else
      something = @left
    end
  end

  def childrens
    how_many = 0
    how_many += 1 if @left
    how_many += 1 if @right
    how_many
  end
end

# Tree class for the binary tree
class Tree
  attr_accessor :root

  def initialize(initial_array)
    @root = build_tree(initial_array)
  end

  def build_tree(tree_array)
    return nil if tree_array.empty?

    tree_array = tree_array.uniq.sort
    mid_point = tree_array.length / 2
    node = tree_array[mid_point]
    left = tree_array[...mid_point]
    right = tree_array[mid_point + 1..]
    node = Node.new(node)
    node.left = build_tree(left)
    node.right = build_tree(right)
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(number)
    node = Node.new(number)
    @root.insert(node)
  end

  def delete(number)
    @root.delete(number)
  end

  def i_love_pry
    binding.pry
  end
end

exercise_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
abc = Tree.new(exercise_array)
abc.insert(420)
abc.insert(20)
abc.pretty_print
abc.delete(23)
abc.pretty_print
abc.insert(23)
abc.pretty_print
