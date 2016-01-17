# coding: utf-8

$:.unshift(File.dirname(__FILE__))

require "module.rb"

include Ghost

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