require "Wrong/assert"
include Wrong::Assert

=begin
  (15)	
  Написать программу, которая проверяет, можно ли из букв, входящих в слово А, составить слово В.
=end

def solution(a, b)
  a.chars.sort == b.chars.sort
end

word1 = "Test"
word2 = "Testing"

assert{ solution(word1, word2) == false }


word1 = "жопа"
word2 = "радость"

assert{ solution(word1, word2) == false }


word1 = "равновесие"
word2 = "своенравие"

assert{ solution(word1, word2) == true }


word1 = "aaa"
word2 = "aaaa"

assert{ solution(word1, word2) == false }


word1 = "abcd"
word2 = "dbac"

assert{ solution(word1, word2) == true }


word1 = ""
word2 = ""

assert{ solution(word1, word2) == true }