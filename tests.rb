# coding: utf-8

$:.unshift(File.dirname(__FILE__))

require "module.rb"

include Ghost

'''

###

fl = true
fl = 0 if hooks(")(") != false
fl = 1 if hooks("()") != true
fl = 2 if hooks("") != true
fl = 3 if hooks("{(})") != false
fl = 4 if hooks("({[()]})") != true
fl = 5 if hooks("({[([)]})") != false

if fl == true
  puts "4 Задание выполненно."
else
  puts "Ошибка в #{fl} задании."
end

###


###
fl = true
fl = false if compress("test!") != "test!"
fl = false if compress("aaaaaaaaa") != "a(9)"
fl = false if compress("") != ""
fl = false if compress("aabbcc") != "aabbcc"
fl = false if compress("aabbcccdd") != "aabbc(3)dd"
fl = false if compress("aaaabcccccdee") != "a(4)bc(5)dee"

if fl
  puts "6 Задание выполненно."
else
  puts "Ошибка в 6 задании."
end

###



###
fl = true
fl = 0 if maxVowels("Довольно часто у детей вызывает затруднение понимание и заучивание гласных и согласных букв, а также звонких и глухих звуков. ауоыиэяюёе ббб") != "test!"

if fl
  puts "6 Задание выполненно."
else
  puts "Ошибка в 6 задании."
end

###




p maxPrimeByBin(1)
p maxPrimeByBin(10)
p maxPrimeByBin(100)
p maxPrimeByBin(1000)

p annagram("a", "a")
p annagram("aab", "ab")

foundRepeatMax([1,2,3,3,3,2,2,2,3])

p major([1,2,2,2,2,2,2,2,2,3,4,5,6])

automorph(1, 1000)

p unionab([1,2,3,4,5], [2,3,4,4,5]) #=> 1,2,2,3,3,4,4,4,5,5

p sortq([1,2,6,4,5,0,0,-3,2,-4,-6]) #=>-3, -4, -6, 0, 0, 1, 2, 6, 4, 5, 2

p armstrong

charsInWords("Из данного предложения выбрать и напечатать слова, превышающие заданное количество букв, с указанием количества символов слова.")

perfectNumbers

digitalsqrt
'''
rhyme