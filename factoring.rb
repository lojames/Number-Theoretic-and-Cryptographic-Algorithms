require_relative 'basic'
include Algorithms

module Factoring
  #Returns perfect root if exists, or nil if not
  def perfect_root(n, bound = 10000)
    power = 2
    root = int_nth_root(n, power)
    until root < bound || root ** power == n
      power += 1
      root = int_nth_root(n, power)
    end
    root ** power == n ? root : nil
  end

  def factors_by_brute_force_trial_division_with_sieve(n, bound = int_nth_root(n, 2))
    return [] if n < 2
    prime_factors = []
    factored = n
    primes = sieve_of_eratosthenes(bound)
    primes.each do |prime|
      while factored%prime == 0
        prime_factors << prime
        factored = factored/prime
        return prime_factors if factored == 0
      end
    end
    factored == 1 || factored == n ? prime_factors : prime_factors << factored
  end

  def factors_by_brute_force_trial_division(n, bound = int_nth_root(n, 2))
    return [] if n < 4
    prime_factors = []
    factored = n
    (2..bound).each do |i|
      while factored%i == 0
        prime_factors << i
        factored = factored/i
        return prime_factors if factored == 1
      end
    end
    factored == 1 || factored == n ? prime_factors : prime_factors << factored
  end

  def pollards_rho(n)
    #IMPLEMENT NEXT
    n
  end
end
