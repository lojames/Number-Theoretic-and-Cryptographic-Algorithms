require_relative 'factoring'
include Factoring

module NumberTheory
  def is_primitive_root?(g,n)
    #IMPLEMENTATION AFTER FACTORING ALGORITHMS HAVE BEEN IMPLEMENTED
  end

  def totient(n)
    return n-1 if is_prime?(n)
    #IMPLEMENTATION AFTER FACTORING ALGORITHMS HAVE BEEN IMPLEMENTED
  end

  #Returns Legendre symbol given an odd prime p
  def legendre(a, p)
    return 0 if a%p == 0
    a.pow((p-1)/2, p) == 1 ? 1 : -1
  end
end
