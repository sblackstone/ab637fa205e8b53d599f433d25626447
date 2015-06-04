


def I(x)
  return 0.5 + I(x-1) if x >= 1
  return 0.5 - I(1-x) if x > 0.5 
  return (I(2*x)/4) + (x**2/2) if x >= 0
  return -1*I(x*-1) 
end


puts I(0.52)