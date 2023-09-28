=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
module Luhn
  def self.seconds_converting(num)
    2*num >= 9 ? 2*num - 9 : 2*num
  end

  def self.valid?(number)
    normalized = number.delete(' ').chars

    return false if normalized.length < 2
    
    return false if normalized.select {|item| !(/^[0-9]/ =~ item)}.any?

    sum = normalized
    .reverse
    .map(&:to_i)
    .map
    .with_index {|item, index| index.even? ? item : seconds_converting(item)}
    .sum
    sum % 10 == 0 ? true : false
  end
end