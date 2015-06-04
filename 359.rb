=begin
An infinite number of people (numbered 1, 2, 3, etc.) are lined up to get a room at Hilbert's newest infinite hotel. The hotel contains an infinite number of floors (numbered 1, 2, 3, etc.), and each floor contains an infinite number of rooms (numbered 1, 2, 3, etc.).

Initially the hotel is empty. Hilbert declares a rule on how the nth person is assigned a room: person n gets the first vacant room in the lowest numbered floor satisfying either of the following:

the floor is empty
the floor is not empty, and if the latest person taking a room in that floor is person m, then m + n is a perfect square
Person 1 gets room 1 in floor 1 since floor 1 is empty. 
Person 2 does not get room 2 in floor 1 since 1 + 2 = 3 is not a perfect square. 
Person 2 instead gets room 1 in floor 2 since floor 2 is empty. 
Person 3 gets room 2 in floor 1 since 1 + 3 = 4 is a perfect square.

Eventually, every person in the line gets a room in the hotel.

Define P(f, r) to be n if person n occupies room r in floor f, and 0 if no person occupies the room. Here are a few examples: 
P(1, 1) = 1 
P(1, 2) = 3 
P(2, 1) = 2 
P(10, 20) = 440 
P(25, 75) = 4863 
P(99, 100) = 19454

Find the sum of all P(f, r) for all positive f and r such that f × r = 71328803586048 and give the last 8 digits as your answer.


100
82
81	83
65	84
64	66	85
50	67	86
49	51	68	87
37	52	69	88
36	38	53	70	89
26	39	54	71	90
25	27	40	55	72	91
17	28	41	56	73	92                  (n+3)**2 - 8
16	18	29	42	57	74	93              n**2 - 7
10	19	30	43	58	75	94              (n+3)**2 - 6
9	  11	20	31	44	59	76	95          n**2 -  5       (11,20,31)        (offset 2)
5	  12	21	32	45	60	77	96          n**2 + 4n       (12,21,32)        (offset 1)
4	   6	13	22	33	46	61	78	97      n**2 + 2n - 2   (6, 13,22)        (offset 1)
2	   7	14	23	34	47	62	79	98      n**2 + 2n - 1   (2,7,14,23)       (offset 0)
1	   3	 8	15	24	35	48	63	80	99  n**2 - 1        (1,3,8,15,24,35)  (offset 0)


2**27 * 3**12

=end

require 'pp'

@squares = Hash.new(nil)

1.upto(1000) do |i|
  @squares[i**2] = i
end


=begin
0.upto(27) do |two|
  0.upto(12) do |three|
    f = 2**two * 3**three
    r = 71328803586048 / f
    puts "#{f} #{r}"
  end
end
=end


hotel = Hash.new(nil)


1.upto(150) do |person|
  f = 1
  while true
    if hotel[f].nil? 
      hotel[f] = [ person ]      
      break
    end
    unless @squares[person+f].nil?
      hotel[f].push person
      break
    end     
    f += 1
  end
end


(hotel.keys.max).downto(1) do |key|
  puts hotel[key].join("\t")
end

