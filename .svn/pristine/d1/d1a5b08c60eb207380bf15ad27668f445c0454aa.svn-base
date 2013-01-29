require 'pp'

def isLeap?(i)
  (i % 4 == 0) and (i % 100 > 0 or i % 400 == 0)
end

def days_in_febuary(i)
  isLeap?(i) ? 29 : 28
end

def days_in_month(month,year) 
  case month
  when 0
    return 31
  when 1
    return days_in_febuary(year)
  when 2
    return 31
  when 3
    return 30
  when 4
    return 31
  when 5
    return 30
  when 6
    return 31
  when 7
    return 31
  when 8
    return 30
  when 9
    return 31
  when 10
    return 30
  when 11
    return 31
  end
end


dow = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
mon = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
def days_in_year(i)
  isLeap?(i) ? 366 : 365
end

##################
begin_year = 1901
end_year   = 2000
day_of_week = 1
##################

total_days = 0
begin_year.upto(end_year) do |y|
  total_days = total_days + days_in_year(y)
end

day_of_month = 0
year  = begin_year
month = 0

count = 0

1.upto(total_days) do |d|
  day_of_week = (day_of_week + 1) % 7
  day_of_month = day_of_month + 1
  if day_of_month > days_in_month(month,year)
    month = (month + 1) % 12
    day_of_month = 1
    year = year + 1 if month == 0
  end
  if day_of_week == 0 and day_of_month == 1
    count = count + 1 
    puts "#{year}-#{month+1}-#{day_of_month}: count = #{count}" 
  end
 
end

puts count