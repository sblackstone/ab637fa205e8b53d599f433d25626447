require 'pp'

correct = Hash.new(true)

100.upto(999) do |j|
  i = j
  o = i % 10
  i /= 10
  t = i % 10
  i /= 10
  h = i % 10
  correct["#{h}#{t}#{o}".to_i] = false if (h >= t and t >= o) or (o >= t and t >= h)

end

def bouncy?(n)
  return false if n < 100
  last = n % 10
  n /= 10
  dir  = nil
  up   = false
  down = false
  (Math::log10(n).floor + 1).times {
    cur = n % 10
    up = true if last < cur
    down = true if last > cur
    return true if (up && down)
    last = cur
    n /= 10
  }
  return (false)
end

yes = 0
no  = 99
j = 100

while true
  if bouncy?(j)
    yes += 1
  else
    no += 1
  end
  if yes / j.to_f >= 0.99
    puts yes / j.to_f
    puts j
    exit
  end
  j += 1
end





