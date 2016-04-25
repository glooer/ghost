require "Wrong/assert"
include Wrong::Assert

=begin
  (17)
  Пусть дана последовательность литер, имеющая вид d1d2 d3… dn (di – цифры, n>1), за которой следует точка. 
  Напишите программу вычисления значения этой алгебраической суммы. Например, 2+3–2+1=4.
=end

def solution(str)
  calc = str.scan(/([\-\+]?)(\d+)/)
  return nil if calc.empty?
  calc.inject(calc.shift.last.to_i){ |z, v| z.__send__(v.first.to_sym, v.last.to_i) }
  
end

text = "2+3-2+1"
assert{ solution(text) == 4 }

text = ""
assert{ solution(text) == nil }

text = "1+2+3+4+5"
assert{ solution(text) == 15 }
