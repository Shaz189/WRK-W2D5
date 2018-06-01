require 'byebug'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    mod = bucket(key)
    @store[mod].include?(key)
  end

  def set(key, val)
    mod = bucket(key)
    if @store[mod].include?(key)
      @store[mod].update(key, val)
    else
      @store[mod].append(key, val)
      @count += 1
    end
  end

  def get(key)
    mod = bucket(key)
    #debugger
    @store[mod].get(key)# if @store[mod].include?(key)
  end

  def delete(key)
    mod = bucket(key)
    @store[mod].remove(key)
    @count -= 1
  end

  def each
    @store.inject([]) {|acc, el| acc << [el.key, el.val] }
  end
  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    key.hash % num_buckets
  end
end
