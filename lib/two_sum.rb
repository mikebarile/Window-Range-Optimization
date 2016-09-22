def okay_two_sum?(arr, target_sum)
  arr.sort!
  start_idx = 0
  last_idx = arr.length - 1
  until start_idx == last_idx
    if arr[start_idx] + arr[last_idx] == target_sum
      return true
    elsif arr[start_idx] + arr[last_idx] > target_sum
      last_idx -= 1
    else
      start_idx += 1
    end
  end
  false
end

def great_two_sum?(arr, sum)
  hash = Hash.new{|h,k| h[k] = 0}
  arr.each{|el| hash[el] += 1}
  (0..sum).each do |int|
    first_num = int if hash[int] > 0
    second_num = sum - int if hash[sum - int] > 0
    return true if first_num && second_num && (sum / 2 != first_num ||
      hash[sum/2] >= 2)
  end
  false
end

arr = [0, 1, 5, 7]
p great_two_sum?(arr, 6) # => should be true
p great_two_sum?(arr, 12) # => should be false
