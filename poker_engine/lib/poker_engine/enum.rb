class Enum < Hash
  def initialize(*members)
    super()
    @reversed = {}
    members.each_with_index {|m, i| self[i] = m }
  end

  def [](k)
     super || @reversed[k]
  end

  def []=(k, v)
    @reversed[v] = k
    super
  end
end

enum = Enum.new(:Apples, :Oranges)

p enum[:Apples] # => 0
p enum[0]       # => :Apples 