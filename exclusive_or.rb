def exclusive_or(num1, num2)
	bin1 = num1.digits(2).reverse
	bin2 = num2.digits(2).reverse
	equalize_length(bin1, bin2)
	xor = bin1.zip(bin2).map { |f, s| f == s ? 0 : 1 }
	return xor.join.to_i(2)
end



# helpers
def add_zeros(array, quantity)
	quantity.abs.times {array.unshift(0)}
	return array
end

def equalize_length(arr1, arr2)
  if (arr1.length - arr2.length) != 0
		# calculate how much zeros needs to be added to the shorter array
		zeros_to_add = (arr1.length - arr2.length)
		# add zeros to the shorter array
		if zeros_to_add.negative? == true
			add_zeros(arr1, zeros_to_add)
		else 
			add_zeros(arr2, zeros_to_add)
		end
  end
  return arr1, arr2
end

puts "n
Enter number one:"
first = gets.strip.to_i

puts "Enter number two:"
second = gets.strip.to_i

puts "The exlusive or is: #{exclusive_or(first, second)}"