class PrimeNumberGenerator

  def generate(first, last, type = :eratosphen)
    if first > last
      first, last = last, first
    end
    eratosphen(first, last)
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

  def eratosphen(from, limit)
    primes = []
    sieve = Array.new(limit + 1, true)
    sieve[0] = false
    sieve[1] = false
    s = 2
    while s**2 <= limit
      if sieve[s]
        ((2 * s)..limit).step(s).each do |i|
          sieve[i] = false if i % s == 0
        end
      end
      s += 1
    end
    (from..limit).each do |i|
      primes << i if sieve[i]
    end
    primes
  end
  
  def valid_natural?(num)
    num.is_a?(Integer) && (num == 2 || (num.odd? && num > 1))
  end
end

__END__

class PrimeNumber
  
  attr_reader :primes
  
  def generate(first, last, type = :eratosphen)
    if first > last
      first, last = last, first
    end
    eratospen(first, last)
  end
  
private 

  def eratosphen(from, limit)
    primes = []
    sieve = Array.new(limit + 1, true)
    sieve[0] = false
    sieve[1] = false
    s = 2
    while s**2 <= limit
      if sieve[s]
        (s..limit).step(s).each do |i|
          sieve[i] = false if i % s == 0
        end
      end
      s += 1
    end
    (from..limit).each do |i|
      primes << i if sieve[i] && (i % 3 != 0) && (i % 5 != 0)
    end
    primes
  end

  def atkin(from=0, limit)
    if from > limit
      limit, from = from, limit
    end
    primes = [2, 3, 5]
    sieve = Array.new(limit + 1)
    sqrt_limit = Math.sqrt(limit).truncate
    (1..sqrt_limit).each do |x|
      x2 = x*x
      (1..Math.sqrt(limit-x2).truncate).each do |y|
        y2 = y*y
        n = 4 * x2 + y2
        if (n <= limit) && [1, 5].include?(n % 12)
          sieve[n] = true
        end
        n -= x2
        if (n <= limit) && (n % 12 == 7)
          sieve[n] = true
        end
        n -= 2 * y2
        if (x > y) && (n <= limit) && (n % 12 == 11)
          sieve[n] = true
        end
      end
    end
    n = 5
    (n..sqrt_limit).each do |i|
      if sieve[i]
        s = i*i
        k = s
        while k <= limit do
          sieve[k] = nil
          k += s
        end
      end
    end
    (from..limit).each do |i|
      primes << i if sieve[i] && (i % 3 != 0) && (i % 5 != 0)
    end
    primes
  end

  def is_prime? num
    return false unless valid_natural?(num)
    limit = Math.sqrt(num).truncate.next
    return true if limit == 2
    (2..limit).each do |i|
      r = num % i
      return false if r == 0
    end
    true
  end
  
  def valid_natural?(num)
    num.integer? && (num == 2 || (num.odd? && num > 1))
  end
end
