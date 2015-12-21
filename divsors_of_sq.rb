def divisors_of_square(n)
  factorization = Hash.new(0)
  @h.factorize(n).each do |f|
    factorization[f[0]] += 2*f[1]
  end
  @h.divisors(n*n, factorization, &proc)
end
