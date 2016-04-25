require "Wrong/assert"
include Wrong::Assert

=begin
  (38)
  Перегруппировать элементы массива A(n) следующим образом: 
  в начале массива – все отрицательные, 
  затем – нулевые 
  и в конце – все положительные элементы (с сохранением порядка следования в каждой группе).
=end


def solution(arr)
  a, b = arr.partition{ |v| v < 0 }
  (a + b.partition{ |v| v == 0 }).flatten
end



arr = [1, 2, 3, 4, -1, 3, -3, 0, 2, -100, 2, 0]
assert{ solution(arr) == [-1, -3, -100, 0, 0, 1, 2, 3, 4, 3, 2, 2] }

arr = [0, -1, 1]
assert{ solution(arr) == [-1, 0, 1] }

arr = [-1, 1]
assert{ solution(arr) == [-1, 1] }

arr = []
assert{ solution(arr) == [] }

arr = [0, 0]
assert{ solution(arr) == [0, 0] }