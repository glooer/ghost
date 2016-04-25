require "Wrong/assert"
include Wrong::Assert

=begin
  (2)
  Зашифровать текст (не более 255 символов) из входного файла, 
  используя перешенанный алфавит. 
  
  Перемешанный алфавит получен случайной перестановкой всех букв исходного алфавита
=end

def shifr(text)
  text = text.split("")
  abc = text.uniq.sort #получили алфавит
  sabc = abc.shuffle #случайный порядок
  
  stext = text.map{|v| sabc[abc.index(v)]}
  
  return [stext.join, sabc.join]
  
end

def solution(filename)
  shifr(IO.read(filename))
end