=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end


class TwoBucket
    def initialize(first_bucket_size, second_bucket_size, desired_liters, full_bucket)
    end


    def moves
        4
    end

    def goal_bucket
        'two'
    end

    def other_bucket
        5
    end

    class Bucket
        attr_accessor :curent_volume, :full_volume
        def initialize(full_volume)
            @full_volume = full_volume
            @curent_volume = 0
        end

        def fill_bucket
            @curent_volume = @full_volume
        end

        def empty_bucket
            @curent_volume = 0
        end

        def pour_into_other(into_bucket)
            into_bucket_emptyness = into_bucket.full_volume - into_bucket.curent_volume
            can_fill_in = into_bucket_emptyness - self.curent_volume
            if can_fill_in > 0
                into_bucket.curent_volume += can_fill_in
                self.curent_volume -= can_fill_in
            else
                into_bucket.curent_volume = into_bucket.full_volume
                self.curent_volume -=into_bucket_emptyness
            end
        end

    end
end

buck1 = TwoBucket::Bucket.new(5)
buck2 = TwoBucket::Bucket.new(3)
buck1.fill_bucket
buck1.pour_into_other(buck2)
puts buck1.curent_volume
puts buck2.curent_volume
