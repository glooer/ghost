require "Wrong/assert"
include Wrong::Assert

=begin
  (16)
  Дан текст. Написать программу определения, является ли этот текст идентификатором; десятичной записью целого числа.
=end

def solution(str)
  !str[/^[\_a-z][\_a-z\d\-]*$/i].nil?
end

text = "_send"
assert{ solution(text) == true }

text = "asdx-1"
assert{ solution(text) == true }

text = "1w"
assert{ solution(text) == false }

text = "333"
assert{ solution(text) == false }

text = "*&"
assert{ solution(text) == false }

text = "a_"
assert{ solution(text) == true }

text = "qQ"
assert{ solution(text) == true }