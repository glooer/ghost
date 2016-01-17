module Ghost

=begin
  (2)
  Зашифровать текст (не более 255 символов) из входного файла, 
  используя перешенанный алфавит. 
  
  Перемешанный алфавит получен случайной перестановкой всех букв исходного алфавита
=end

  def shifr(text)
    text = text.split("")
    abc = text.uniq.sort #получили алфавит
    sabc = abc.sort_by{rand} #случайный порядок
    
    stext = text.map{|v| sabc[abc.index(v)]}
    
    return [stext.join, sabc.join]
    
  end

=begin
  Получить треугольник Паскаля
  В верхней строке пишутся две единицы.
  Все  последующие строки начинаются и заканчиваются еденицами.
  Промежуточные числа получаются сложением соседних чисел вышестоящей строки.
=end
  
	def pascalTriangle(n)
    r = [1]
    res = [r]
		while n > 0
			rn = [1]
			for i in (0..r.size - 2)
				rn << r[i] + r[i + 1]
			end
			r = (rn << 1)
      res << rn
			n -= 1
		end
		res
	end
  
=begin
  (4)
  В строке могут содеражтся кругоые, квадратные и фигурные скобки -- как открывающие, так и закрывающие
=end

  def hooks(str)
    s = "()[]{}"
    p = []
    
    str.split("").each do |v|
      if !(x = s.index(v)).nil?
        if (x % 2).zero?
          p << v
        else
          return false if p.pop != s[x - 1]
        end
      end
    end
    p.size.zero?
  end

=begin
  (6)
  Написать программу, которая позволяет сжимать текст
  
  криво :(
=end

  def compress(str)
    str = str.split("")
    res = ""
    cache = []
    str.each do |v|
      if cache.last == v
        cache << v
      else
        if cache.size > 2 
          res += "#{cache.last}(#{cache.size})"
        else
          res += cache.join
        end
        cache = [v]
      end      
    end
    if cache.size > 2 
      res += "#{cache.last}(#{cache.size})"
    else
      res += cache.join
    end
    res
  end

end