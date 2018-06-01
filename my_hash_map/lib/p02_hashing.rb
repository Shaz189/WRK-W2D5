class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    if self.empty?
      return "nil".ord.hash
    end  
    semi_hash = self.reverse.join("").ord
    if semi_hash.even?
      (semi_hash*17.75).hash
    else
      (semi_hash/1.44).hash
    end
  end
end

class String
  def hash
    median = self.length / 2 
    first_half = self[0...median].chars.map(&:ord)
    second_half = self[median..-1].chars.map(&:ord)
    arr = []
    first_half.each do |el|
      second_half.each do |el2|
        arr << (el ^ el2)
      end
    end
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
