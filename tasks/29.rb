require "Wrong/assert"
include Wrong::Assert

=begin
  (29)
  Натуральное число называется совершенным, 
  если оно равно сумме всех своих делителей, 
  включая единицу и исключая себя. 
  Например, 6=1+2+3 – число совершенное. 
  Вывести первые N (N<5) совершенных чисел на экран.
=end


def solution(n)
  i = 2
  while n > 0
    i += 1
    d = 1
    2.upto(i - 1){ |v| d += v if (i % v).zero? }
    n -= 1 if i == d
  end
  i
end

assert{ solution(1) == 6 }
assert{ solution(2) == 28 }
assert{ solution(3) == 496 }
assert{ solution(4) == 8128 }