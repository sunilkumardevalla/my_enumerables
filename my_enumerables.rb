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

# Tests

input = [1, 3, 6, 7, 2, 5, 1]
puts input

# my_each
puts "my_each:"
input.my_each { |i| p i.to_s + ""}

# my_each_with_index
puts "my_each_with_index:"
input.my_each_with_index { |i, index| puts index.to_s + ":" + i.to_s + ""}

# my_select
puts "my_select:"
p input.my_select { |i| i < 5 }

# my_all?
puts "my_all?:"
p input.my_all? { |i| i < 5 }

# my_any?
puts "my_any?:"
p input.my_any? { |i| i < 5 }

# my_none?
puts "my_none?:"
p input.my_none? { |i| i < 5 }

# my_count
puts "my_count:"
p input.my_count(2)

# my_inject
puts "my_inject:"
p input.my_inject(10) { |sum, i| sum += 1 }

# my_multiply_els
puts "multiply_els:"
p multiply_els(input)

# my_map
puts "my_map:"
p input.my_map(proc) { |i| i * 2 }








