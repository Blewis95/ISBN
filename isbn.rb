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
# def isbn_13_checker

# end