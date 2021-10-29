# frozen_string_literal: true

require 'date'
# class Meetup
class Meetup
  WEEK_DAYS = %w[sunday monday tuesday wednesday thursday friday saturday].map(&:to_sym).freeze
  DAY_ORDERING = %w[first second third fourth firth].map(&:to_sym).freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, daycode)
    if daycode == :teenth
      potential_days = (13..19).to_a
      get_question = weekday.to_s << '?'
      proc_question = get_question.to_sym
      days = potential_days.map { |d| Date.new(@year, @month, d) }
      day = days.filter{|day| WEEK_DAYS[day.wday] == weekday}[0]
    elsif DAY_ORDERING.include?(daycode)
      multiplayer = DAY_ORDERING.index(daycode)
      first_month_day = WEEK_DAYS[Date.new(@year, @month, 1).wday]
      if first_month_day == weekday
        Date.new(@year, @month, 1 + 7 * multiplayer)
      elsif WEEK_DAYS.index(weekday) > WEEK_DAYS.index(first_month_day)
        days_between = WEEK_DAYS.index(weekday) - WEEK_DAYS.index(first_month_day)
        Date.new(@year, @month, 1 + days_between + 7 * multiplayer)
      else
        days_between = 6 - WEEK_DAYS.index(first_month_day) + WEEK_DAYS.index(weekday) + 1
        Date.new(@year, @month, 1 + days_between + 7 * multiplayer)
      end
    else
      last_month_day = WEEK_DAYS[Date.new(@year, @month, 1).next_month.prev_day.wday]
      last_month_date = Date.new(@year, @month, 1).next_month.prev_day.mday
      if last_month_day == weekday
        Date.new(@year, @month, 1).next_month.prev_day
      elsif WEEK_DAYS.index(weekday) > WEEK_DAYS.index(last_month_day)
        days_between = WEEK_DAYS.index(last_month_day) + 7 - WEEK_DAYS.index(weekday)
        Date.new(@year, @month, last_month_date - days_between)
      else
        days_between = WEEK_DAYS.index(last_month_day) - WEEK_DAYS.index(weekday)
        Date.new(@year, @month, last_month_date - days_between)
      end
    end
  end
end
