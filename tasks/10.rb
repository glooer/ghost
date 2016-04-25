require "Wrong/assert"
include Wrong::Assert

=begin
  (10)	
  Матрица имеет седловую точку aij, если aij является минимальным в i-ой строке и максимальным 
  в j-ом столбце или наоборот, минимальным в j-ом столбце и максимальным в i-ой строке. 
  Напишите программу нахождения номера строки и номера столбца хотя бы одной седловой точки заданной целочисленной квадратной матрицы L (n, n). 
=end

def search(matrix)
  matrix.map{ |col| col.map{ |row| row == yield(col) ? row : nil } }
end

def inter(a, b)
  a.map.with_index do |col, i|
    col.map.with_index do |row, j|
      (!row.nil? and row == b[i][j]) ? [i, j] : nil
    end
  end
end

def solution(matrix)
  #найдем все минимумы и максимумы в строках
  min_s = search(matrix){ |col| col.min }
  max_s = search(matrix){ |col| col.max }
  #и столбцах
  min_c = search(matrix.transpose){ |col| col.min }.transpose
  max_c = search(matrix.transpose){ |col| col.max }.transpose
  
  # а теперь пересечения min_s & max_c  и  max_s & min_c
  #inter найдет пересечения и заменит их индексами
  (inter(min_s, max_c) + inter(max_s, min_c)).flatten.compact.map(&:next).group_by.with_index{ |_, i| i / 2 }.values
  #складываем массивы, сплющиваем их в одномерный массив, удаляем все nil элементы, увеличиваем оставшиеся на 1, и группируем
  
  
end




matrix = [
  [5, 6, 4, 5],
  [-2, 5, 3, 7],
  [8, 7, -2, 6]
]

assert{ solution(matrix) == [[1, 3]] }

matrix = [
  [2, 3, 5, 2],
  [2, 4, 6, 2],
  [-2, 7, 2, 0]
]

assert{ solution(matrix) == [[1, 1], [1, 4], [2, 1], [2, 4]] }

matrix = [
  [3, 2, 1],
  [1, 3, 4]
]

assert{ solution(matrix) == [] }