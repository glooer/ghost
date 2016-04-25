require "Wrong/assert"
include Wrong::Assert

=begin
  (40)
  Даны два массива целых чисел А и В, упорядоченные по возрастанию. Поместить все элементы этих массивов в массив С, который также должен быть упорядочен по возрастанию. Сортировать массив С нельзя!
=end


def solution(a, b, c = [])
  return (c + a + b) if a.empty? or b.empty?
  return a[0] < b[0] ? solution(a[1..-1], b, c << a[0]) : solution(a, b[1..-1], c << b[0])
end


a = [1,2,3,4]
b = [2,3,4,5,6]
c = [1,2,2,3,3,4,4,5,6]
assert{ solution(a, b) == c }


a = [1]
b = [1]
c = [1,1]
assert{ solution(a, b) == c }

a = [5]
b = [1]
c = [1,5]
assert{ solution(a, b) == c }