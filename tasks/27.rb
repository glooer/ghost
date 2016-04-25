require "Wrong/assert"
include Wrong::Assert

=begin
  (27)	
  Напишите программу нахождения разложения целого числа m на простые множители. 
  Все простые множители требуется вывести в порядке возрастания.
=end

def solution(n)
  res = []
  i = 2
  while n > 1
    while (n % i).zero?
      n /= i
      res << i
    end
    i += 1
  end
  res
end

assert{ solution(42) == [2, 3, 7] }
assert{ solution(27) == [3, 3, 3] }
assert{ solution(2310) == [2, 3, 5, 7, 11] }