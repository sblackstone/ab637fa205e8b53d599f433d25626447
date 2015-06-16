require 'pp'
require 'matrix.rb'


m = Matrix.rows [ [1,1], [1,0]]

4.times {
  m *= m
  pp m[0,1]
  pp m
}
