require "Wrong/assert"
include Wrong::Assert

=begin
  (11)	
  Напишите программу, которая проверяет, 
  является ли заданная целочисленная квадратная матрица L (n, n) магическим квадратом, 
  т.е. сумма элементов матрицы по строкам, по столбцам и по диагоналям одинакова.
=end

def solution(matrix)

  return false if matrix.empty? or matrix.first.size != matrix.size #если она не квадратная, то ну нафиг её проверять... сломает ещё что нибудь..
  
  sd = sp = 0
  0.upto(matrix.size - 1) do |i| 
    sd += matrix[-i][-i]
    sp += matrix[i][i]
  end
  
  return false if sd != sp #если диагонали не равны то не является.
  
  #складывем строки и проверяем равны ли они диагонали
  matrix.each do |col|
    return false if col.inject(:+) != sd
  end
  
  #делаем столбцы строками и проверяем тоже самое
  matrix.transpose.each do |col|
    return false if col.inject(:+) != sd
  end
  
  true
  

end

matrix = [
  [1]
]

assert{ solution(matrix) == true }

matrix = [
  [2, 7, 6],
  [9, 5, 1],
  [4, 3, 8]
]

assert{ solution(matrix) == true }


matrix = [
  [2, 7, 1],
  [9, 5, 1],
  [4, 3, 8]
]

assert{ solution(matrix) == false }

matrix = [
  [16, 3, 2, 13],
  [5, 10, 11, 8],
  [9, 6, 7, 12],
  [4, 15, 14, 1]
]

assert{ solution(matrix) == true }