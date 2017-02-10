def valid_isbn?(isbn_string)								#Main Function
	new_num = isbn_dash_and_space_deleter(isbn_string)		#runs the function to take the inputed string and delete the spaces and dashed in it.

	# puts new_num.length 									#for debugging purposes (lines 4-6)
	# puts check_for_symbols(new_num)
	# puts isbn_10_x_check?(new_num)

	if (new_num.length == 10) && (check_for_symbols(new_num)) && isbn_10_x_check?(new_num)
		isbn_10_sumcheck(new_num)
	elsif (new_num.length == 13) && (check_for_symbols(new_num))
		isbn_13_sumcheck(new_num)
	else
		return false
	end

end

def isbn_dash_and_space_deleter(isbn_num)
	new_num = isbn_num.delete("-")
	new_num = new_num.delete(" ")
	return new_num
end

def isbn_10_sumcheck(isbn_num)

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


def isbn_13_checker(isbn_num)
	if (isbn_num.length == 13)
		return true		
	else
		return false
	end
end

def isbn_13_sumcheck(isbn_num)

	isbn_array = isbn_num.split("")
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

			#print isbn_number_array[i], " "
			# puts sum
		end
		#puts isbn_number_array[i]
	end

	#print sum

	checksum = sum % 10

	checksum = 10 - checksum

	checksum = checksum % 10

	#puts checksum

	if checksum == isbn_number_array.last
		return true
	else
		return false
	end

end


def check_for_symbols(symbol_check)
	symbol_check2 = symbol_check.split("")
	array = Array.new

	symbol_check2.each do |holder|
		if (holder == "0") || (holder == "1") || (holder == "2") || (holder == "3") || (holder == "4") || (holder == "5") || (holder == "6") || (holder == "7") || (holder == "8") || (holder == "9")

			array.push(holder)
		end
	end

	if (array.length != symbol_check.length)
		return false
	else
		return true
	end
end

def isbn_10_x_check?(isbn)
	if isbn.upcase.include?("X")
		if (isbn.upcase.index("X") == isbn.length - 1)
			return true
		else
			return false
		end
	else
		return true
	end
end