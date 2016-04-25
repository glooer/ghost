require "Wrong/assert"
include Wrong::Assert

=begin
  (18)
  Составить программу нахождения максимального из имеющихся в текстовом файле чисел. Текстовый файл содержит произвольный текст.
=end

def solution(filename)
  IO.read(filename).scan(/\-?\d+\.?\d*/).map(&:to_i).max
end

assert{ solution("18.rb") == 18 }