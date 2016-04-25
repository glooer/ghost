require "Wrong/assert"
include Wrong::Assert

=begin
  (4)
  В строке могут содеражтся кругоые, квадратные и фигурные скобки -- как открывающие, так и закрывающие
=end

def solution(str)
  brackets = %w(( ) [ ] { })
  s = []
  str.gsub(/[^\(\)\[\]\{\}]/, "").chars.each do |v|
    z = brackets.index(v)
    if z.even?
      s << v
    else
      return false if s.pop != brackets[z - 1]
    end
  end
  return s.empty?
end


assert{ solution("") == true }
assert{ solution("(") == false }
assert{ solution("()") == true }
assert{ solution(")(") == false }
assert{ solution("[]") == true }
assert{ solution("{}") == true }
assert{ solution("{)}") == false }
assert{ solution("{[()]}") == true }
assert{ solution("{z[c(b)]gfdsf}") == true }