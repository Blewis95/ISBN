require "minitest/autorun"
require_relative "isbn.rb"

class TestISBN < Minitest::Test

	# def test_length_is_equal_to_10
	# 	assert_equal(true,isbn_10_checker("123456789x"))
	# end

	# def test_length_is_less_than_10
	# 	assert_equal(false,isbn_10_checker("12345"))
	# end

	# def test_length_is_greater_than_10
	# 	assert_equal(false,isbn_10_checker("112344567899"))
	# end

	# def test_gets_rid_of_dashes
	# 	assert_equal("12345", isbn_dash_deleter("1-2-3-4-5"))
	# end

	# def test_gets_rid_of_spaces
	# 	assert_equal("12345", isbn_space_deleter("1 2 3 4 5"))
	# end

	# def test_successful_case_isbn10
	# 	assert_equal(true, isbn_10_sumcheck("0471958697"))
	# end

	# def test_failed_case_isbn10
	# 	assert_equal(false,isbn_10_sumcheck("4780470059029"))
	# end



	def test_length_is_equal_to_13
		assert_equal(true,isbn_13_checker("1234567890123"))
	end

	def test_length_is_less_than_13
		assert_equal(false,isbn_13_checker("12345"))
	end

	def test_length_is_greater_than_13
		assert_equal(false,isbn_13_checker("1123445678999999"))
	end

	def test_successful_case_isbn13
		assert_equal(true, isbn_13_sumcheck("9780470059029"))
	end

	def test_failed_case_isbn13
		assert_equal(false,isbn_13_sumcheck("4780470059029"))
	end

end