require "Wrong/assert"
include Wrong::Assert

=begin
  (6)
  Написать программу, которая позволяет сжимать текст, заданный пользователем, 
  по следующему алгоритму: любая последовательность из более чем 3-х вхождений одного и того же символа заменяется на этот символ и количество символов в скобках, 
  например, «aaaabcccccdee» заменяется «a(4)bc(5)dee».
=end

def solution(str)
  str.gsub(/(.)\1{2,}/){ |v| "#{v[0]}(#{v.size})" }
end


assert{ solution("") == "" }
assert{ solution("aa") == "aa" }
assert{ solution("aaa") == "a(3)" }
assert{ solution("aaaa") == "a(4)" }
assert{ solution("aaaabcccccdee") == "a(4)bc(5)dee" }