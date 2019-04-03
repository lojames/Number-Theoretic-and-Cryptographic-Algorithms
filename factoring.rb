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

  def f_x(x, b, n)
    x.pow(2,n) + b % n
  end

  def pollards_rho(n)
    y, r, q = rand(1...n-1), 1, 1
    g, b, m = 1, rand(1...n-1), rand(1...n-1)
    until g > 1

      x = y
      r.times { y = f_x(y, b, n) }
      k = 0
      until k >= r || g > 1
        ys = y
        [m, r-k].min.times do
          y = f_x(y, b, n)
          q = q * (x-y).abs % n
        end
        g = q.gcd(n)
        k = k + m
      end
      r *= 2
    end


    if g == n
      until g > 1
        ys = f_x(ys, b, n)
        g = (x-ys).abs.gcd(n)
      end
    end

    g == n ? nil : g
  end

  def factors_by_pollards_rho(n, time = 10)
    rem = n
    factors = []
    start_time = Time.now
    executing = true
    thr = Thread.new {
      until rem == 1 || is_prime?(rem)
        factor = pollards_rho(rem)
        if factor
          if is_prime?(factor)
            while rem%factor == 0
              factors << factor
              rem = rem/factor
            end
          else
            temp_factors = factors_by_pollards_rho(factor)
            temp_factors.each do |f|
              while rem%f == 0
                factors << f
                rem = rem/f
              end
            end
          end
        end
      end
      executing = false
    }

    while Time.now - start_time < time && executing
      sleep(0.5)
    end
    factors << rem if rem > 1
    factors
  end
end

include Factoring
