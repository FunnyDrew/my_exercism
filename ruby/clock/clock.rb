=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end
require 'byebug'

class Clock
  attr_accessor :hours, :minutes
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  def initialize(time = {hour: 0, minute: 0})
    @hours = time[:hour] || 0
    @minutes = time[:minute] || 0
  end

  def clock_normalized_output(time)
    time = time < 10 ? "0#{time}" : "#{time}"
  end

  def hour_to24(hour)
    hour % HOURS_IN_DAY
  end

  def add_to_h(hour)
    self.hours = self.hours + hour
  end

  def min_to60(min)
    
    add_to_h(minutes / MINUTES_IN_HOUR)
    minutes = self.minutes % MINUTES_IN_HOUR 
  end

  def + (time)
    
    self.hours = self.hours + time.hours
    self.minutes = self.minutes + time.minutes
    self
  end

  def - (time)
    
    self.hours = self.hours - time.hours
    self.minutes = self.minutes - time.minutes
    self
  end

  def == (time)
    minutes_equality = (self.min_to60(self.minutes) == time.min_to60(time.minutes))
    hours_equality = (self.hour_to24(self.hours) == time.hour_to24(time.hours))    
    hours_equality && minutes_equality
  end

  def to_s
    min = min_to60(minutes)    
    hh = hour_to24(hours)
    
    clock_normalized_output(hh)<<":"<<clock_normalized_output(min)
  end
end

