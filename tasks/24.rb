require "Wrong/assert"
include Wrong::Assert

=begin
  (24)
  Число из n цифр называется числом Армстронга, если сумма его цифр в степени n равна самому числу. 
  Например: 1634 = 14 + 64 + 34 + 44. 
  Составить программу, находящую все числа Армстронга среди двузначных и трехзначных чисел.
=end

class Numeric
  def armstrong?
    size = self.to_s.size
    self.to_s.chars.inject(0){ |z, v| z + v.to_i ** size } == self
  end
end

def solution(n = 10, m = 999)
  (n..m).select{ |v| v.armstrong? }
end

assert{ solution == [153, 370, 371, 407] }