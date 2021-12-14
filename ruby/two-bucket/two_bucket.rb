=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end


class TwoBucket
    
    def initialize(first_bucket_size, second_bucket_size, desired_liters, full_bucket)

        @should_be_full = Bucket.new(first_bucket_size, "one")
        @should_be_empty = Bucket.new(second_bucket_size, "two")

        @desired_liters = desired_liters
        @full_bucket = full_bucket
        
        @should_be_full, @should_be_empty = @should_be_empty, @should_be_full if full_bucket == "two"        
    end


    def moves        
        count = 0        
        while @should_be_full.curent_volume != @desired_liters && @should_be_empty.curent_volume != @desired_liters

            if @should_be_full.is_empty?
                @should_be_full.fill_bucket
            elsif @should_be_empty.is_full?
                @should_be_empty.empty_bucket
            elsif @should_be_empty.full_volume ==  @desired_liters
                @should_be_empty.fill_bucket
            else 
                @should_be_full.pour_into_other(@should_be_empty)
            end
            count += 1
           
        end
        count        
    end

    def goal_bucket
        @should_be_full.curent_volume == @desired_liters ? @should_be_full.name : @should_be_empty.name
    end

    def other_bucket
        @should_be_full.curent_volume != @desired_liters ? @should_be_full.curent_volume : @should_be_empty.curent_volume
    end

    class Bucket
        attr_accessor :curent_volume, :full_volume, :name
        def initialize(full_volume, name)
            @full_volume = full_volume
            @curent_volume = 0
            @name = name
        end        

        def is_empty?
            curent_volume == 0
        end

        def is_full?
            curent_volume == full_volume 
        end

        def fill_bucket
            @curent_volume = full_volume            
        end

        def empty_bucket
            @curent_volume = 0            
        end

        def can_receive?(free_space, liters_into)        
            free_space > liters_into
        end

        def pour_into_other(into_bucket)

            free_space = into_bucket.full_volume - into_bucket.curent_volume            
           
            if can_receive? free_space, curent_volume
                into_bucket.curent_volume += curent_volume
                self.curent_volume = 0
            else
                into_bucket.curent_volume = into_bucket.full_volume
                self.curent_volume -= free_space
            end
        end

    end
end

