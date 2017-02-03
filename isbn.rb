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

# def isbn_invalid_characters_input(isbn_num)
# 	if (isbn_num.class != String)
# 		return "Error entry must be a string"
# 	else
# 		isbn_array = isbn_num.split("")

# 		(isbn_array.length).times do |x|
# 			if (isbn_array[x].to_i != Fixnum)
# 				return "Error, Entry must be a String of Fixnums"
# 			end
# 		end
# 	end
		
# end

def isbn_10_sumcheck(isbn_num)

	isbn_10_checker(isbn_num)
	isbn_dash_deleter(isbn_num)
	isbn_space_deleter(isbn_num)
	
	# error_holder = isbn_invalid_characters_input(isbn_num)

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
	# elsif (error_holder == "Error entry must be a string") || (error_holder == "Error, Entry must be a String of Fixnums")
	# 	return error_holder
	else
		return false
	end

end


def isbn_13_checker(isbn_num13)
	if ((isbn_num13.length < 13) || (isbn_num13.length > 13))
		return false
	else
		return true
	end
end

def isbn_13_sumcheck(isbn_num13)

	isbn_13_checker(isbn_num13)
	isbn_dash_deleter(isbn_num13)
	isbn_space_deleter(isbn_num13)

	isbn_array = isbn_num13.split("")
	array_length = isbn_array.length

	#puts array_length

	sum = 0
	isbn_number_array = Array.new

	(array_length).times do |i|
		isbn_number_array[i] = isbn_array[i].to_i
	end

	#print isbn_number_array


	for i in 0..(array_length - 2)
		if (i % 2 == 1)
			sum += 3 * isbn_number_array[i]

			# print isbn_number_array[i], " "
			# puts sum
			
		else
			sum += 1 * isbn_number_array[i]

			# print isbn_number_array[i], " "
			# puts sum
		end
		#puts isbn_number_array[i - 1]
	end

	# print sum

	checksum = sum % 10

	checksum = 10 - checksum

	checksum = checksum % 10

	#print checksum

	if checksum == isbn_number_array.last
		return true
	else
		return false
	end

end