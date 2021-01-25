module Enumerable

  def my_each
    self.length.times { |i| yield(self[i]) }
    self
  end

  def my_each_with_index
    self.length.times { |i| yield(self[i], i) }
    self
  end

  def my_select
    array = []
    self.my_each { |i| array << i if yield(i) }
    array
  end

  def my_all?
    result = true
    self.my_each { |i| break result = false unless yield(i) }
    result
  end

  def my_any?
    result = false
    self.my_each { |i| break result = true if yield(i) }
    result
  end

  def my_none?
    result = true
    self.my_each { |i| break result = false if yield(i) }
    result
  end

  def my_count(item)
    count = 0
    self.my_each { |i| count += 1 if item == i }
    count
  end

  def my_inject(result = 0)
    self.my_each { |i| result = yield(result, i) }
    result
  end

  def my_map(proc=nil)
    array = []
    block_given? ?
      self.my_each { |i| array << yield(i) } : 
      self.my_each { |i| array << proc.call(i) }
    array
  end

end

def multiply_els(array)
  array.my_inject(1) { |product, i| product * i }
end

proc = Proc.new { |i| i * 2 }
