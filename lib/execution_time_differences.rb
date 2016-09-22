require 'byebug'


def lcs(arr)
  winning_sum = arr.max
  sum = arr.first
  arr[1..-1].each_with_index do |el, idx|
    idx-=1
    if idx != 0 && arr[idx-1] < 0 && el > sum + el
      sum = el #sum = 0, then sum += el
    elsif el >= 0 || (idx != arr.length - 1 && el + arr[idx+1] >= 0)
      sum += el
    else
      winning_sum = sum if sum > winning_sum
      sum = el
    end
    # debugger
  end
  winning_sum = sum if sum > winning_sum
  winning_sum
end

p lcs([-5, -1, -3])
