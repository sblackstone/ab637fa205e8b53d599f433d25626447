/*
Given two points (x1,y1,z1) and (x2,y2,z2) in three dimensional space, the Manhattan distance between those points is defined as 
|x1-x2|+|y1-y2|+|z1-z2|.

Let C(r) be a sphere with radius r and center in the origin O(0,0,0).
Let I(r) be the set of all points with integer coordinates on the surface of C(r).
Let S(r) be the sum of the Manhattan distances of all elements of I(r) to the origin O.

E.g. S(45)=34518.

Find S(10**10).

10_000_000_000


x = r sin(t) cos(p)
y = r sin(t) sin(p)
z = r cos(t)

p from 0 to pi (0 to 90 degrees)
t from 0 to pi (0 to 90 degrees)
5_000_000_000

2*x = y**2

0,0,x (2 signs)(3 permutations) =  6 COVERED..
0,x,y (4 signs)(6 permutations) = 24
0,x,x (4 signs)(3 permutations) = 12
x,x,x (8 signs)(1 permutation)  =  8
x,x,y (8 signs)(3 permutations) = 24
x,y,z (8 signs)(6 permutations) = 48

g++ -O3 -L/opt/local/lib/ -lboost_thread-mt -lboost_date_time-mt -lboost_system-mt -I/opt/local/include 360.cpp && time ./a.out

*/

#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
#include <boost/unordered_map.hpp>
using namespace std;



#define ulong unsigned long long

#define R 45

boost::unordered_map<ulong, ulong> smap;


int main() {
	for (int i=0; i*i < R; smap[i] = i*i);
	return 0;
}