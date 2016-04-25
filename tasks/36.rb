require "Wrong/assert"
include Wrong::Assert

=begin
  (36)	
  Дан символьный файл f. 
  Составить программу, определяющую наибольшее количество и саму последовательность цифр, идущих в файле подряд.
=end


def solution(filename)
  IO.read(filename).scan(/\d+/).max_by(&:size)
end


filename = "36.rb"

assert{ solution(filename) == "36" }
