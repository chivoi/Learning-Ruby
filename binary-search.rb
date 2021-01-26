# The assignment was as follows: 
# Implement a function that will perform a binary search, and return the number of steps it takes to complete the search.
# When the array has an even number of values the midpoint index will be rounded up.

# Example: 
# binary_search([1,5,8,12,20,21,35], 8) # should return [2, 3] 
# In this case the index returned would be 2 and it should take 3 steps. 


#recursive implementation
def binary_search(arr, value, steps=0, index=[])
  index << arr.index(value)
  midpoint = arr.length/2
  steps += 1
  
  if arr.empty? || arr.include?(value) == false
    return "Value is not in the array"
  else
    if arr[midpoint] == value
      return result(index[0], steps)
    elsif arr[midpoint] > value
      binary_search(arr[0..(midpoint-1)], value, steps, index)
    else arr[midpoint] < value
      binary_search(arr[(midpoint+1)..(-1)], value, steps, index)
    end 
  end
end

# loop implementation
def binary_search(arr, value)
	index = arr.index(value)
	steps = 0
	if arr.length == 1
		steps += 1
		return result(index, steps)
	elsif arr.empty? || arr.include?(value) == false
		return "Value is not in the array"
	end

  loop do
    midpoint = arr.length/2
    if arr[midpoint] == value
      steps += 1
      break
    elsif arr[midpoint] > value
      arr.reject! {|i| i >= arr[midpoint]}
      steps += 1
    else arr[midpoint] < value
      arr.reject! {|i| i <= arr[midpoint]}
      steps += 1
    end
  end
	return result(index, steps)
end

# helper to get result array from index and steps
def result (index, steps)
	result = []
	result << index
	result << steps
	return result
end