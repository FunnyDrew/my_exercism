=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end
require 'date'
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  
  def day(weekday, daycode)
    if daycode == :teenth
      days = (13..19).to_a
      question = weekday.to_s<<"?"
      sym = question.to_sym      
      day,_ = days.map{|d| Date.new(@year, @month, d)}.filter(&sym)
      return day
    end
    meetup_month = Date.new(@year, @month,1)
    puts meetup_month
  end
end