require './primes.rb'
require 'pp'

=begin
void divisors(vector<ulong> *cur, vector<ulong> *fact, vector<ulong> *pfact) {
  if (cur->size() == pfact->size()) {
		ulong f = 1;
    	for(int i = 0; i < pfact->size(); i++) {
        if (cur->at(i) == 1) {
					f *= pfact->at(i);
        }
	    }
			fact->push_back(f);
			return;
  }
	for (int i=0; i < 2; i++) {
		cur->push_back(i);
		divisors(cur, fact, pfact);
		cur->pop_back();
	}
}

=end


def divisors(pfact)

end



pp divisors({ 2 => 3, 3 => 1, 5 => 2})

#pp divisors([3, 2,3, 3,1, 5,2], [1], 1)

#exit

def newton(x, curx, rounds)
  0.upto(rounds-1) do |round|
    curx = curx - ((curx**2 - x) / (2.0*curx))
  end  
  return(curx)
end


Primes.setup(190)

n = 1
pfactors = [1]
Primes.primes.each do |p|
  n *= p
  pfactors.push(1)
  pfactors.push(p)
end
pp pfactors
nsr = newton(n, Math.sqrt(n).round,6000).round
pp divisors(pfactors, [1], 1)

