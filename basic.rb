module Algorithms
  #Wrapper method which utilizes Miller-Rabin
  def is_prime?(n, k=100)
    return true if n == 2 || n == 3
    return false if n < 2 || n % 2 == 0
    d = n-1
    r = 0
    until d.odd?
      d = d/2
      r += 1
    end

    k.times do
      return false if miller_rabin(n, d ,r) === false
    end
    true
  end

  # Compute d and r with n + 1 = d*2**r
  def miller_rabin(n, d, r)
    a = rand(2..n-2)
    x = a.pow(d, n)
    return true if x == 1 || x == n-1

    (r-1).times do
      x = x.pow(2, n)
      return false if x == 1
      return true if x == n-1
    end
    false
  end

  #Adapted from Newton's method
  def int_nth_root(x, n)
    guess = x
    x1 = x+1
    while guess < x1
      x1 = guess
      x2 = x1*(n-1) + x / (x1**(n-1))
      guess = x2/n
    end
    x1
  end

  def trial_division_is_prime?(n)
    return false if n < 2
    termination_bound = int_nth_root(n, 2)
    (2..termination_bound).each {|i| return false if n%i == 0}
    return true
  end

  #Return a list of all primes from 2 to n (inclusive) using an optimized sieve of eratosthenes
  def sieve_of_eratosthenes(n)
    return [] if n < 2
    return [2] if n == 2

    primes = []
    is_prime_array = Array.new(n+1, true)
    is_prime_array[0..1] = false, false

    sieve_termination_bound = int_nth_root(n, 2)
    (2..sieve_termination_bound).each do |i|
      if is_prime_array[i]
        primes << i
        (i*2..n).step(i) {|j| is_prime_array[j] = false}
      end
    end

    (sieve_termination_bound+1..n).each {|i| primes << i if is_prime_array[i]}
    primes
  end

  #Returns number of digits of an integer or the integer portion of a float
  def num_digits(n)
    return nil if n.class == String && n.match(/[a-zA-Z]/)
    n.to_i.to_s.length
  end

  #Generate an n digit prime number in specified base (default 10)
  def generate_prime(n, base=10)
    num = rand(base**(n-1)...base**n)
    until is_prime?(num, 100)
      num = rand(base**(n-1)...base**n)
    end
    num
  end

end
