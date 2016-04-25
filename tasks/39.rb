require "Wrong/assert"
include Wrong::Assert

=begin
  (39)	
  Написать программу, которая меняет значение каждого элемента двумерной таблицы на сумму окружающих его восьми членов, оставляя границу массива неизменной.
=end


def solution(matrix)
  res = matrix.map{ |v| v.dup } #сначала надо скопировать!
  1.upto(matrix.size - 2) do |i|
    1.upto(matrix[i].size - 2) do |j|
      res[i][j] = matrix[i - 1][j - 1] + matrix[i - 1][j] + matrix[i - 1][j + 1] +
                  matrix[i][j - 1]     +                    matrix[i][j + 1]     +
                  matrix[i + 1][j - 1] + matrix[i + 1][j] + matrix[i + 1][j + 1]
    end
  end
  res
end

matrix = Array.new(5){ |i| Array.new(5){ |i| i + 1 }.rotate(i) }
assert{ solution(matrix) == [[1, 2, 3, 4, 5], [2, 24, 27, 25, 1], [3, 27, 25, 23, 2], [4, 25, 23, 21, 3], [5, 1, 2, 3, 4]] }

matrix = Array.new(5){ |i| Array.new(5){ 1 } }
assert{ solution(matrix) == [[1, 1, 1, 1, 1], [1, 8, 8, 8, 1], [1, 8, 8, 8, 1], [1, 8, 8, 8, 1], [1, 1, 1, 1, 1]] }