require "Wrong/assert"
include Wrong::Assert

=begin
  (9)
  Напишите программу решения следующей задачи: 
  "Среди простых чисел, не превосходнящх n, найти такое, 
  в двоичной записи которого максимальное количество едениц. 
  Число назывется простым, если оно не имеет других делителей, кроме 1 и самого себя"
=end

class Numeric
  def prime?
    2.upto(self - 1) do |i|
      return false if (self % i).zero?
    end
    
    true
  end
end

def solution(n)
  (2..n).to_a.select{ |v| v.prime? }.max_by{ |v| v.to_s(2).count("1") }
end

assert{ solution(42) == 31 }
assert{ solution(1000) == 991 }