require_relative 'factoring'
include Factoring

module NumberTheory

  def brute_force_is_primitive_root?(g,n)
    t = -1
    et = totient(n)
    (1...et).each do |e|
      r = g.pow(e,n)
      # puts  "n = #{n}, g = #{g}, r = #{r}"
      return false if r == 0 || r == 1 || t == r
      t = r
    end
    g.pow(et,n) == 1 ? true : false
  end

  def is_primitive_root?(g,n)
    #IMPLEMENTATION AFTER FACTORING ALGORITHMS HAVE BEEN IMPLEMENTED
  end

  def totient(n)
    #REIMPLEMENT WITH COMPLETED FACTORING ALGORITHM AFTER IMPLEMENTED
    return n-1 if is_prime?(n)
    factors = factors_by_brute_force_trial_division(n)
    frequencies = Hash.new(0)
    factors.each {|f| frequencies[f] += 1}
    t = 1
    frequencies.keys.each do |f|
      if frequencies[f] == 1
        t *= (f-1)
      else
        t *= (f ** (frequencies[f]-1)) * (f-1)
      end
    end
    t
  end

  #Returns Legendre symbol given an odd prime p
  def legendre(a, p)
    return 0 if a%p == 0
    a.pow((p-1)/2, p) == 1 ? 1 : -1
  end
end
