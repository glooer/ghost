require "Wrong/assert"
include Wrong::Assert

=begin
  (25)
  Задача Диксона. 
  Будем говорить, что три натуральных числа образуют дружественную тройку, 
  если сумма собственных делителей каждого числа равна сумме двух других чисел. 
  Отыскать хотя бы одну дружественную тройку натуральных чисел.
=end

def factorization(n)
  '''
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
  '''
  (2...n).select{ |v| (n % v).zero? }
end

def solution
  d = (0..100).group_by{ |v| factorization(v).inject(&:+) }
  d.delete(nil)
  d.select{ |k, v| v.size >= 3}.values
end


assert{ solution == [[18, 51, 91], [44, 74, 81]] }
