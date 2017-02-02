def isbn_10_checker(isbn_num)
	if ((isbn_num.length < 10) || (isbn_num.length > 10))
		return false
	else
		return true
	end
end

def isbn_dash_deleter(isbn_num)
	new_num = isbn_num.delete"-"
	return new_num
end

def isbn_space_deleter(isbn_num)
	new_num = isbn_num.delete" "
	return new_num
end

def isbn_10_sumcheck(isbn_num)

	isbn_10_checker(isbn_num)
	isbn_dash_deleter(isbn_num)
	isbn_space_deleter(isbn_num)

	isbn_array = isbn_num.split("")
	array_length = isbn_array.length

	#puts array_length

	sum = 0
	isbn_number_array = Array.new

	(array_length).times do |i|
		isbn_number_array[i] = isbn_array[i].to_i
	end

	#print isbn_number_array


	for i in 1..(array_length - 1)
		sum += isbn_number_array[i - 1] * i
		#puts isbn_number_array[i]
	end

	#print sum

	checksum = sum % 11

	#print checksum

	if checksum == isbn_number_array.last
		return true
	else
		return false
	end

end
# def isbn_13_checker

# end