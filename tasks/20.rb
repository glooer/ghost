require "Wrong/assert"
include Wrong::Assert

=begin
  (20)	
  Мажорирующим элементом массива A[1..N] принято называть элемент, встречающийся в массиве более N/2 раз. Определите, есть ли такое элемент в массиве, если есть укажите его и его местонахождение.
=end

def solution(arr)
  arr.group_by{ |v| arr.size.to_f / arr.count(v) }.select{ |k, v| k <= 2 }.values.flatten.uniq
end


arr = [1, 1, 2, 2, 3, 1]
assert{ solution(arr) == [1] }

arr = [1, 2, 3, 4, 4, 4, 4,4,4,4,4,4,4,4,4]
assert{ solution(arr) == [4] }

arr = [1, 1, 2, 2]
assert{ solution(arr) == [1, 2] }