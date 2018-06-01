class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
    @count = 0
  end

  def insert(key)
    resize! if @count == @num_buckets
    i = key.hash % @num_buckets
    unless include?(key)
      @store[i] << key 
      @count += 1
    end
  end

  def include?(key)
    i = key.hash % @num_buckets
    @store[i].include?(key)
  end

  def remove(key)
    i = key.hash % @num_buckets
    if include?(key)
      @store[i].delete(key)
      @count -= 1
    end
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
