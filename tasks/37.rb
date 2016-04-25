require "Wrong/assert"
include Wrong::Assert

=begin
  (37)	
  Задан массив A(N). Написать программу определения значения k, при котором величина А(1)+...+А(k)–A(k+1)–...–A(N) минимальна.
=end


def solution(arr)
  return nil if arr.empty?
  sum_right = arr.inject(&:+)
  sum_left = 0
  smini = nil
  ati = nil
  
  arr.each.with_index do |v, i|
    sum_left += v
    sum_right -= v
    if smini.nil? or (sum_left - sum_right).abs < smini
      ati = i
      smini = (sum_left - sum_right).abs
    end
  end
  ati + 1
end



arr = [1, 2, 3]
assert{ solution(arr) == 2 }

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
assert{ solution(arr) == 6 }

arr = []
assert{ solution(arr) == nil }

arr = [1, 2, 3, 1000]
assert{ solution(arr) == 3 }

