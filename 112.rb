require 'pp'


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





