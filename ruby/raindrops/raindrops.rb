=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/r
aindrops` directory.
=end

class Raindrops
    def self.convert(number)
        string = ''
        if number % 3 == 0 then string = "#{string}Pling" end
        if number % 5 == 0 then string = "#{string}Plang" end
        if number % 7 == 0 then string = "#{string}Plong" end
        result = string == '' ? number.to_s : string
        return result
    end
end
