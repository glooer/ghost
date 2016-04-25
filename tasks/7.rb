require "Wrong/assert"
include Wrong::Assert

=begin
  (7) 
  Написать программу, которая в заданном предложении выводит слово (или слова), 
  в котором (ых) доля гласных букв русского алфавита максимальна.
=end

def solution(str)
  v = %w(а у о ы и э я ю ё е)
  words = str.tr("АБВГДЕЁЖЗИКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ", "абвгдеёжзиклмнопрстуфхцчшщъыьэюя").split #руби не умеет downcase кирилицы, по этому вот так..
  
  r = words.group_by{ |word| (word.chars - v).size.to_f / word.chars.size }.min
  return (r.nil? or r.first == 1) ? [] : r.last
end

assert{ solution("") == [] }
assert{ solution("фф") == [] }
assert{ solution("ффа") == ["ффа"] }
assert{ solution("аа уу фф") == ["аа", "уу"] }
assert{ solution("Написать программу, которая в заданном предложении выводит слово (или слова), в котором (ых) доля гласных букв русского алфавита максимальна.") == ["которая"] }