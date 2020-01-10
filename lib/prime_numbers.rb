require 'prime'

# implementation using prime class
# https://docs.ruby-lang.org/en/2.6.0/Prime.html
def primes (number)
  primes_array = []
  Prime.each(number) do |p|
    primes_array.push(p)
  end

  primes_array
end


# sieve of eratosthenes implementation
# https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
def sieve_of_eratosthenes(max)
  if max < 1 || !(max.is_a?(Integer))
    raise TypeError.new "the number given must be an integer greater than zero"
  end

  root = Integer.sqrt(max)
  primes = Array.new(max + 1) { |i| i.odd? || i == 2 } #every prime number other than 2 is an odd number.

  #to find all the prime numbers until max, it will be enough just to perform the sifting only by the prime numbers, which do not exceed the root of max.
  3.step(root, 2).each do |i|
    next unless primes[i] # next if not initialized as prime
    #i*i, i*i+i, i*i+2i, i*i+3i
    (i * i).step(max, i) do |j|
      primes[j] = false
    end
  end

  #Select all prime numbers
  2.upto(max).select { |i| primes[i] }
end


# sieve of atkin implementation
# https://en.wikipedia.org/wiki/Sieve_of_Atkin
# https://www.ams.org/journals/mcom/2004-73-246/S0025-5718-03-01501-1/S0025-5718-03-01501-1.pdf
# https://iq.opengenus.org/sieve-of-atkin/
def sieve_of_atkin(max)
  if max < 1 || !(max.is_a?(Integer))
    raise TypeError.new "the number given must be an integer greater than zero"
  end

  root = Integer.sqrt(max)
  sieve = Array.new(max){ |i| i == 2 || i == 3 }

  for i in 1..root do
    for j in 1..root do
      n = 4 * (i * i) + (j * j)
      # All numbers with modulo-sixty remainder 1, 13, 17, 29, 37, 41, 49, or 53 have a modulo-twelve remainder of 1 or 5.
      if (n <= max) and (n % 12 == 1 || n % 12 == 5)
        sieve[n] = !sieve[n]
      end
      n = 3 * (i * i) + (j * j)
      # All numbers with modulo-sixty remainder 7, 19, 31, or 43 have a modulo-six remainder of 1.
      # These numbers are prime if and only if the number of solutions to 3x^2 + y^2 = n is odd and the number is square free.
      if (n <= max) and (n % 12 == 7)
        sieve[n] = !sieve[n]
      end
      n = 3 * (i * i) - (j * j)
      # All numbers with modulo-sixty remainder 11, 23, 47, or 59 have a modulo-twelve remainder of 11.
      # These numbers are prime if and only if the number of solutions to 3x^2 – y^2 = n is odd and the number is square free.
      if (i > j) and (n <= max) and (n % 12 == 11)
        sieve[n] = !sieve[n]
      end
    end
  end

  # If n is prime, omit all multiples of its square
  (5..root).each { |i|
    if sieve[i]
      (i * i).step(max, i * i) do |j|
        sieve[j] = false
      end
    end
  }

  #Select all prime numbers
  2.upto(max).select { |i| sieve[i] }
end


