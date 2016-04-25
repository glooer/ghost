require "Wrong/assert"
include Wrong::Assert

=begin
  (22)	
  Пусть дан текстовый файл. 
  Написать программу, которая для каждой строки указывает номер строки и распечатывает слово наибольшей длины в этой строке. 
  Если их несколько, то следует распечатать все такие слова.
=end

def solution(filename)
  File.open(filename, "r").each.with_index do |s, i|
    if x = s.scan(/[а-яa-zё\'\-]+/i).group_by{ |v| v.size }.max
      print "#{i + 1}\t\t#{x.last.join(", ")}\n"
    end
  end.close
end

solution("22.rb") 

# aaa bbb ccc