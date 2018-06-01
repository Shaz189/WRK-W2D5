class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    if num > @max || num < 0
      raise "Out of bounds"
    elsif @store[num]
      return

    else 
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    
  end

  def validate!(num)
    
  end
end

require 'byebug'

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    i = num % @num_buckets
    @store[i] << num
  end

  def remove(num)
    i = num % @num_buckets
    return unless include?(num)
    @store[i].delete(num)
  end

  def include?(num)
    # debugger
    i = num % @num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    resize! if @count == num_buckets
    i = num % @num_buckets
    unless include?(num) 
      @store[i] << num
      @count += 1
    end
  end

  def remove(num)
    i = num % @num_buckets
    if include?(num) 
      @store[i].delete(num)
      @count -= 1 
    end
  end

  def include?(num)
    i = num % @num_buckets
    return true if @store[i].include?(num)
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      @store.concat(Array.new(num_buckets) {Array.new})
  end
end
