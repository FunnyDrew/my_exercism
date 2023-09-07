=begin
Write your code for the 'Flatten Array' exercise in this file. Make the tests in
`flatten_array_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/flatten-array` directory.
=end

class FlattenArray
  def self.flatten(list)
   result = []
   self.array_recorder(result, list)
   result
  end

  def self.array_recorder(acc, array)
    array.map do |item|
      if item.is_a? Array
        self.array_recorder(acc, item)      
      elsif item != nil
        acc<<item
      end  
    end
  end
end
