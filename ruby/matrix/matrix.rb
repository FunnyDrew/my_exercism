=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
    def initialize(string)
        @string_matrix = string
        @matrix = self.to_matrix
    end

    def to_matrix
        @string_matrix.split("\n").reduce([]) do |matrix, row|            
            data = row.split(" ").map{|num| num.to_i}
            matrix.push(data)            
        end
    end

    def rows
        @matrix
    end

    def columns
        @matrix.transpose
    end
end
