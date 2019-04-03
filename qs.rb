class Relation
  attr_reader :u, :v, :powers, :marked

  def initialize(u, v, powers)
    @u = u
    @v = v
    @powers = {}
    powers.each {|power| @powers[power] = true}
    @marked = false
  end

  def add(n)
    @powers[n] ? @powers.delete(n) : @powers[n] = true
  end

  def mark
    @marked = true
  end

  def to_s
    "u = #{@u}, v = #{@v}, factors = #{@powers.keys.to_s}, #{marked}"
  end
end

def factors_by_trial_division(v, factor_base)
  v_vector = []
  factor_base.each do |prime|
    power = 0
    while v%prime == 0
      v = v/prime
      power += 1
    end
    v_vector << prime if power%2 != 0
  end
  v_vector
end

factor_base = [2, 3, 5, 7, 11, 13, 17, 23, 29]
n = 63787
products = [1360, 6664, 10240]
us = [439, 445, 449]
relations = []
products.each_with_index do |product, i|
  power = factors_by_trial_division(product, factor_base)
  relations << Relation.new(us[i], product, power)
end


t0 = Time.now
factor_base.each do |prime|
  factors_to_add = []
  relations.each do |relation|
    if !relation.marked && relation.powers[prime]
      relation.mark

      relation.powers.keys.each do |power|
        factors_to_add << power unless power == prime
      end
      break
    end
  end

  factors_to_add.each do |factor|
    relations.each { |relation| relation.add(factor) if relation.powers[prime] }
  end
end


u, v = 1, 1
powers_to_check = []
relations.each do |relation|
  unless relation.marked && relation.powers.keys.length != 0
    powers_to_check = relation.powers.keys
    break
  end
end

relations.each do |relation|
  if powers_to_check.any? {|power| relation.powers[power]}
    u = (u*relation.u)
    v *= relation.v
  end
end

puts relations

v = Integer.sqrt(v)

puts u
puts v

puts (u-v).abs.gcd(n)
