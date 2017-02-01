require "minitest/autorun"
require_relative "isbn.rb"

class TestISBN < Minitest::Test

	def test_length_is_equal_to_10
		assert_equal(true,isbn_10_checker("123456789x"))
	end

	def test_length_is_less_than_10
		assert_equal(false,isbn_10_checker("12345"))
	end

	def test_gets_rid_of_dashes
		assert_equal("12345", isbn_dash_deleter("1-2-3-4-5"))
	end

end