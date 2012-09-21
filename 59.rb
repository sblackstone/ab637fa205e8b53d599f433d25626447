require 'pp'

class Message
  attr_reader :enc_arr,:dec_arr
  def initialize(enc)
    @enc_arr = enc.split(",").map(&:to_i)
    @dec = []
  end
  
  def msg
    @dec.map(&:chr).join
  end
  
  def sum
    s = 0
    msg.each_byte do |c|
      s = s + c
    end
    return s
  end
  
  
  def apply_key(ka)
    i = 0
    @enc_arr.each_index do |e|
      @dec[e] = @enc_arr[e] ^ ka[i]
      i = (i + 1) % ka.size
    end
  end
      
end


@str = ""
File.open("cipher1.txt") do |f|
  while (line = (f.gets))
    @str = @str + line
  end
end


m = Message.new(@str)
97.upto(122) do |i|
  97.upto(122) do |j|
    97.upto(122) do |k|
      m.apply_key([i,j,k])
      if m.msg.match(/the/) and m.msg.match(/and/) and m.msg.match(/is/)
        puts i,j,k
        puts m.msg
        puts m.sum
      end      
    end
  end
end

