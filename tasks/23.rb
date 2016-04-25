require "Wrong/assert"
include Wrong::Assert

=begin
  (23)
  Дан текстовый файл f, содержащий программу на языке Pascal. Удалите из этого файла все комментарии. Считайте, что каждый оператор программы занимает не более одной строки файла f.
=end

def solution(filename, newfile)
  nf = File.open(newfile, "w")

  File.open(filename, "r").each do |s|
    nf.write(s.gsub(/\/\/.*$/, ""))
  end.close
  
  nf.close
end

solution("23.pas", "23_new.pas") 