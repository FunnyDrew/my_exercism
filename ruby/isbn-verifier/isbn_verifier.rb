=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end

module IsbnVerifier

	def self.is_X? char
		char == 'X'
	end

	def self.prevalid?(isbn_code)
		isbn_code.delete('-') =~ /\b\d{9}(\d|X)\b/ ? true : false
	end

	def self.valid?(isbn_code)
		return false unless self.prevalid?(isbn_code)
		
		str_without_def = isbn_code.delete('-').chars
		indexes = str_without_def
			.each_with_index.map do |value, index|
				d_index = self.is_X?(value) ? 10 : value.to_i
				d_index * (10 - index)			
			end

		indexes.sum % 11 == 0
	end
end