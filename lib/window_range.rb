require_relative 'stackqueue'

def naive_solution(arr, w)
  current_max_range = 0
  i = 0
  until i + w - 1 == arr.length
    diff = arr[i..i+w-1].max - arr[i..i+w-1].min
    current_max_range = diff if diff > current_max_range
    i+=1
  end
  current_max_range
end

def optimized_solution(arr, w)
  current_max_range = 0
  mmsq = MinMaxStackQueue.new
  w.times {mmsq.enqueue(arr.shift)}
  current_max_range = mmsq.max - mmsq.min
  until arr.length == 0
    mmsq.enqueue(arr.shift)
    mmsq.dequeue
    diff = mmsq.max - mmsq.min
    current_max_range = diff if diff > current_max_range
  end
  current_max_range
end

p optimized_solution([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_solution([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_solution([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_solution([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
