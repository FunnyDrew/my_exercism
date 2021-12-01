=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end
require 'pry'

class TwoBucket
    @@move = 0;
    def initialize(first_bucket_size, second_bucket_size, desired_liters, full_bucket)
        if full_bucket == "one"
            @should_be_full = Bucket.new(first_bucket_size, "one")
            @should_be_empty = Bucket.new(second_bucket_size, "two")
        else
            @should_be_full = Bucket.new(second_bucket_size, "two")
            @should_be_empty = Bucket.new(first_bucket_size, "one")
        end
        @desired_liters = desired_liters
        @full_bucket = full_bucket
    end


    def moves            
        while @should_be_full.curent_volume != @desired_liters && @should_be_empty.curent_volume != @desired_liters
            if @should_be_full.is_empty?
                @should_be_full.fill_bucket
            elsif @should_be_empty.is_full?
                @should_be_empty.empty_bucket
            else 
                @should_be_full.pour_into_other(@should_be_empty)
            end
            #binding.pry
        end
        @should_be_full.move        
    end

    


    def goal_bucket
        @should_be_full.curent_volume == @desired_liters ? @should_be_full.name : @should_be_empty.name
    end

    def other_bucket
        @should_be_full.curent_volume != @desired_liters ? @should_be_full.curent_volume : @should_be_empty.curent_volume
    end

    class Bucket
        @@move = 0;
        attr_accessor :curent_volume, :full_volume, :name
        def initialize(full_volume, name)
            @full_volume = full_volume
            @curent_volume = 0
            @name = name
        end

        def move
            @@move
        end

        def is_empty?
            self.curent_volume == 0
        end

        def is_full?
            self.curent_volume == self.full_volume 
        end

        def fill_bucket
            @@move += 1
            @curent_volume = @full_volume            
        end

        def empty_bucket
            @@move += 1
            @curent_volume = 0            
        end

        def pour_into_other(into_bucket)
            @@move += 1
            into_bucket_emptyness = into_bucket.full_volume - into_bucket.curent_volume
            can_fill_in = into_bucket_emptyness - self.curent_volume
            #binding.pry
            if can_fill_in > 0
                into_bucket.curent_volume += self.curent_volume
                self.curent_volume = 0
            else
                into_bucket.curent_volume = into_bucket.full_volume
                self.curent_volume -=into_bucket_emptyness
            end
        end

    end
end

#game = TwoBucket.new(3,5,1,'one')
#puts game.moves
#puts game.goal_bucket
#puts game.other_bucket