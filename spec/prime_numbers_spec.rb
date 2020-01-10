require 'prime_numbers'

RSpec.describe 'prime numbers' do
  it 'returns all prime numbers using prime class implementation' do
    expect(primes(10)).to eq([2, 3, 5, 7])
  end

  it 'raises an exception if the input is not an integer greater than 0' do
    expect { sieve_of_eratosthenes(0) }.to raise_exception
  end

  it 'returns all prime numbers up to 100 using sieve of eratosthenes implementation' do
    expect(sieve_of_eratosthenes(100)).to eq(primes(100))
  end

  it 'returns all prime numbers up to 100 using sieve of atkin implementation' do
    expect(sieve_of_atkin(100)).to eq(primes(100))
  end

  it 'returns all prime numbers up to 10000 using sieve of eratosthenes implementation' do
    expect(sieve_of_eratosthenes(10000)).to eq(primes(10000))
  end

  it 'returns all prime numbers up to 10000 using sieve of atkin implementation' do
    expect(sieve_of_atkin(10000)).to eq(primes(10000))
  end
end

