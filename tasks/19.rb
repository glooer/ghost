require "Wrong/assert"
include Wrong::Assert

=begin
  (19)	
  В массиве чисел М(n) найти число (или числа), повторяющееся максимальное количество раз.
=end

def solution(arr)
  arr.group_by{ |v| arr.count(v) }.values.max_by(&:size).uniq
end


arr = [1,2,3,4,5,6,4,3,2,2,3,4,5,3,2,3]
assert{ solution(arr) == [3] }

arr = [1, 1, 2, 2, 3]
assert{ solution(arr) == [1, 2] }