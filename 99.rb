f  = File.open("base_exp.txt")
@max = 0
@maxline = 0
@curline = 0
while (line = f.gets)
  @curline += 1
  b,e = line.strip.split(",").map(&:to_i)
    v = Math.log(b)*e
    if v > @max
      @max = v
      @maxline = @curline
    end
end

puts @maxline