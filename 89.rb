require 'pp'

@values = {
  'I' => 1,
  'IV' => 4,
  'V' => 5,
  'IX' => 9,
  'X' => 10,
  'XL' => 40,
  'L' => 50,
  'XC' => 90,
  'C' => 100,
  'CD' => 400,
  'D' => 500,
  'CM' => 900,
  'M' => 1000
}


def int_to_roman(n)
  order = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I']
  roman = ""
  order.each do |i|
    while n >= @values[i]
      roman += i
      n -= @values[i]
    end
  end
  return roman
end


def roman_to_int(s)
  arr = s.split("")
  i   = 0
  sum = 0
  while i < s.length
    if i < arr.length - 1 and @values[arr[i]] < @values[arr[i+1]]
      sum -= @values[arr[i]]
      sum += @values[arr[i+1]]
      i += 2
    else
      sum += @values[arr[i]]
      i += 1
    end
  end
  return sum
end

f = File.open("89-numbers.txt")

savings = 0

f.each do |line|
  numeral = line.strip
  int = roman_to_int(numeral)
  roman = int_to_roman(int)
  savings += numeral.length - roman.length
end
puts savings
