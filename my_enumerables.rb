module Enumerable

  def my_each
    self.length.times { |i| yield(self[i]) }
    self
  end

  def my_each_with_index
    self.length.times { |i| yield(self[i], i) }
    self
  end
end


#Tests

input = [1, 3, 6, 7, 2, 5, 1]
puts input

#my_each
puts "my_each:"
input.my_each { |i| p i.to_s + ""}

#my_each_with_index
puts "my_each_with_index:"
input.my_each_with_index { |i, index| puts index.to_s + ":" + i.to_s + ""}
