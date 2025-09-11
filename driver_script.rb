# frozen_string_literal: true

require 'pry-byebug'
require_relative 'main'

array = Array.new(15) { rand(1..100) }
bst = Tree.new(array)
bst.pretty_print
puts 'is the tree balanced?'
bst.balanced?
puts 'level order traversal'
p bst.level_order
puts 'in order traversal'
p bst.in_order
puts 'pre_order traversal'
p bst.pre_order
puts 'post_order traversal'
p bst.post_order
puts 'adding numbers to make tree unbalanced'
bst.insert(120)
bst.insert(130)
bst.insert(140)
bst.insert(150)
bst.insert(170)
bst.insert(190)
bst.pretty_print
puts 'is the tree unbalanced?'
bst.balanced?
puts 'rebalancing tree'
bst.re_balance
bst.pretty_print
puts 'is the tree balanced?'
bst.balanced?
puts 'level order traversal'
p bst.level_order
puts 'in order traversal'
p bst.in_order
puts 'pre_order traversal'
p bst.pre_order
puts 'post_order traversal'
p bst.post_order
