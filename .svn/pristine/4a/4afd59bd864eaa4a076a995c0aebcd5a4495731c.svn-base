GOLDEN_RATIO = (1 + Math.sqrt(5)) / 2

def fib(n)
  (GOLDEN_RATIO**n - (-1 /GOLDEN_RATIO)**n)  / Math.sqrt(5)
end

a = 0
b = 1
i = 1
while true 
  i = i + 1
  c = a + b
  a = b
  b = c
  if c.to_s.length == 1000
    puts i
    break
  end
end
