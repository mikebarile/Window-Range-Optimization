class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader :min, :max, :store
  def initialize
    @store = []
    @max = []
    @min = []
  end

  def push(el)
    @store << el
    @max << el if @max.empty? || el > @max.last
    @min << el if @min.empty? || el < @min.last
  end

  def pop
    @max.pop if peek == @max.last
    @min.pop if peek == @min.last

    popped = @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue
  attr_reader :in, :out
  def initialize
    @in = MyStack.new
    @out = MyStack.new
  end

  def max
    if @in.empty?
      @out.max.last
    elsif @out.empty?
      @in.max.last
    else
      @in.max.last > @out.max.last ? @in.max.last : @out.max.last
    end
  end

  def min
    if @in.empty?
      @out.min.last
    elsif @out.empty?
      @in.min.last
    else
      @in.min.last < @out.min.last ? @in.min.last : @out.min.last
    end
  end

  def enqueue(el)
    until @out.empty?
      @in.push(@out.pop)
    end
    @in.push(el)
  end

  def dequeue
    until @in.empty?
      @out.push(@in.pop)
    end
    out.pop
  end

  def peek
    @out.peek
  end

  def size
    @in.size + @out.size
  end

  def empty?
    @in.empty? && @out.empty?
  end
end
