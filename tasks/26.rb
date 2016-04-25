require "Wrong/assert"
include Wrong::Assert

=begin
  (26)
  Написать программу нахождения всех пар «соседних» простых чисел, 
  не превосходящих N, троичные представления которых получаются друг из друга записью цифр в обратном порядке. 
  Первая такая пара – это 5 и 7.
=end


def primes(n)
  isPrime = Array.new(n){true}
  isPrime[0] = false
  isPrime[1] = false
  i = 2
  while (i * i < n)
    if isPrime[i]
      j = i * i
      while j < n
        isPrime[j] = false
        j += i
      end
    end
    i += 1
  end
  
  isPrime.map.with_index{ |v, i| i if v }.compact
end

def solution(n)
  primes = primes(n)
  res = []
  1.upto(primes.size - 1) do |i|
    res << [primes[i - 1], primes[i]] if primes[i - 1].to_s(3) == primes[i].to_s(3).reverse 
  end
  res
end

assert{ solution(50) == [[5, 7], [31, 37]] }