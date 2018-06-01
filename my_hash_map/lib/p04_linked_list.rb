require 'singleton'
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
  
  def change_val(new_val)
    @val = new_val
  end
  
  def self.all
     arr = []
     ObjectSpace.each_object(Node) {|x| arr << x}
     arr
   end
   
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :list
  include Enumerable
  def initialize
    # @list = {}
    @head = Node.new(nil, nil)
    @tail = Node.new(nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    i = @head.next
    until i == @tail
      if i.key == key
        return i.val
      end
      i = i.next
    end  
    
  end

  def include?(key)
    i = @head.next
    until i == @tail
      if i.key == key
        return true
      end
      i = i.next
    end 
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev_node = @tail.prev 
    prev_node.next = new_node
    new_node.next = @tail
    @tail.prev = new_node 
    new_node.prev = prev_node
  end

  def update(key, val)
    i = @head.next
    until i == @tail
      if i.key == key
        i.val = val
      end
      i = i.next
    end    
  end

  def remove(key)
    i = @head.next
    until i == @tail
      if i.key == key
        break
      end
      i = i.next
    end
    prev_node = i.prev
    next_node = i.next 
    prev_node.next = next_node 
    next_node.prev = prev_node
  end

  def each(&prc)
    i = @head.next
    until i == @tail
      prc.call(i)
      i = i.next
    end   
  end


  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
