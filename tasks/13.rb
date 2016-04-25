require "Wrong/assert"
include Wrong::Assert

=begin
  (13)
  Составьте программу для нахождения автоморфных чисел в отрезке [m,n]. Автоморфным числом называется число, которое равно последним числам своего квадрата. Например, 52=25, 62=36, 252=625.
=end

class Numeric
  def automorph?
    !(self ** 2).to_s[/#{self}$/].nil?
  end
end

def solution(m, n)
  (m..n).select{ |v| v.automorph? }
end

assert{ solution(0, 42) == [0, 1, 5, 6, 25] }