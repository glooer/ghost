require "Wrong/assert"
include Wrong::Assert

=begin
  (14)
  Пусть дано натуральное k (100<k<1000). Напечатайте k-ю цифру последовательности 123457891011121314…, в которой выписаны подряд все натуральные числа.
=end

def solution(k)
  i = 0
  size = 0
  while k > size
    i += 1
    size += i.to_s.size
  end
  i.to_s[k - size - 1].to_i
end


assert{ solution(100) == 5 }
assert{ solution(423) == 7 }
assert{ solution(999) == 9 }