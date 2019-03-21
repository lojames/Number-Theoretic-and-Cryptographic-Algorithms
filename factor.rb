require_relative 'number_theory'

if ARGV.length != 1
  puts "Invalid number of arguments."
  exit
end

if ARGV[0].match(/^\d+$/)
  n = ARGV[0].to_i
  num_digits = num_digits(n)
  puts "Attempting to factor #{n} with #{num_digits} digits."

=begin
  Select factoring algorithm based on number of digits.  Need to do testing for
  optimal selection cases.
    1) Trial Division
    2) Pollards Rho
    3) ECM
    4) Quadratic Sieve
=end
end
