# Various Number Theoretic and Cryptographic Algorithms

This git includes various algorithms useful for factoring large positive integers and computing discrete logorithms in Zp*. All code has been written in Ruby.  Certain algorithms that are normally implemented for floats have been adapted to work exclusively for large positive integers. 

The algorithms are currently organized into modules.  To use, require the file and include the module if necessary.

**Due to YARV's GLI, this project will be re-coded in Python 3.0 for a truly parallel implementation of the SIQS and Index Calculus algorithms.**

# Basic Algorithms

- Fast primality testing of a large, positive, odd integer n using k-pass Miller-Rabin: `is_prime?(n, k)`
- Determing the floor of the n'th root of x via Newton's Method: `int_nth_root(x, n)`
- Generate of a list of prime numbers from 2 to a specified bound, n, using the Sieve of Eratosthenes: `sieve_of_eratosthenes(n)`
- Determine number of digits of an positive integer n: `num_digits(n)`
- Generate a random prime of n digits of specified base: `generate_prime(n, base)`

# Factoring Algorithms

Efficient factorization of numbers can be done by running factor.rb with an argument of the number to be factored. **NOT YET IMPLEMENTED**

Example: `ruby factor.rb 619835809803103591050315351353151351374658678455798063350913509251035901290135193`

- Naive factoring of a positive integer n via brute force by trial division: `factors_by_brute_force_trial_division(n, bound)`. This method is useful and efficient for small numbers.  The method returns an array of the prime factorization of the number. 
- Pollard's Rho with Brent's cycle detection: `pollards_rho(n)`.
- Factor n into prime factors using Pollard's Rho with Brent's cycle detection or until `time` seconds have elapsed: `factors_by_pollards_rho(n, time).
- ECM using Montgomery Curves.  **NOT YET IMPLEMENTED**
- Quadratic Sieve using Contini's version of the Self-Initializing Quadratic Sieve that can be run in parallel. **NOT YET IMPLEMENTED**

# Number Theory

- Determine if g is a primitive root in multiplicative groups of integers modulo n using brute force. `brute_force_is_primitive_root?(g,n)`
- Efficient determination of the totient of n which utilizes factoring. `totient(n)` *Current implementation uses brute force trial division.*
- Determine the legendre symbol of a and the prime p: `legendre(a,p)`
