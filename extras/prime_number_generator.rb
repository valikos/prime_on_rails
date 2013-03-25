class PrimeNumberGenerator
  
  def initialize(options = {})
    @data = options
  end
  
  def generate(first, last)
    primes = []
    if first < last
      first.upto(last) do |i| 
        is_prime?(i) and primes << i 
      end
    elsif first > last
      first.downto(last) do |i| 
        is_prime?(i) and primes << i 
      end
    else
      is_prime?(first) and primes << first
    end
    primes
  end

  def is_prime? num
    return false unless valid_natural?(num)
    limit = Math.sqrt(num).to_i.next
    return true if limit == 2
    (2..limit).each do |i|
      r = num % i
      return false if r == 0
    end
    true
  end  

protected
  
  def valid_natural?(num)
    num.is_a?(Integer) && (num == 2 || (num.odd? && num > 1))
  end
end
