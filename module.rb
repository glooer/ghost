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
  (3)
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

=begin
  (7)
  Написать программу, которая в заданном предложении выводит слово (или слова), в котором(ых) доля гласных букв русского алфавита максимальна.
  
  #FIXME downcase для русских букв не работает, нужен велосипед, или подключай гем unicode и используй Unicode::downcase
=end

  def maxVowels(str)
    vowels = %w(а у о ы и э я ю ё е)
    words = str.downcase.split.map{|v| v.gsub(/[^а-я]/i, "")}
    
    h = {}
    words.each do |v|
      share = v.size.to_f / (v.size - (v.split("") - vowels).size) #точно будет доля гласных? а ещё деление на 0 может быть...
      if h[share].nil?
        h[share] = [v]
      else
        h[share] << v
      end
    end
    p h.min.last
  end
  
=begin
  (9)
  Напишите программу решения следующей задачи: "Среди простых чисел, не превосходнящх n, найти такое, в двоичной записи которого максимальное количество едениц. Число назывется простым, если оно не имеет других делителей, кроме 1 и самого себя"
=end
  
  def maxPrimeByBin(n)
    def prime?(n)
      for i in (2...n)
        return false if (n % i).zero?
      end
      return true
    end
    maxPrimeI = n
    maxPrimeCountOnes = 0
    for i in (2..n)
      if prime?(i) and maxPrimeCountOnes < i.to_s(2).count("1")
         maxPrimeCountOnes = i.to_s(2).count("1")
         maxPrimeI = i
      end
    end
    maxPrimeI
  end
  
=begin
  (15)
  Написать программу, которая проверяет, можно ли из букв, входящих в слово А составить слово В.
=end

  def annagram(s1, s2)
    s1.split("").sort.join.include?(s2.split("").sort.join)
  end
  
=begin
  (18)
  Составить программу нахождения максимального из имеющихся в текстовом файле чисел. Текстовый файл содержит произвольный текст.
  
  #FIXME работу с файлом мне запили!
=end 
  def s18(bigtext)
    bigtext.scan(/\d+/).map{|v| v.to_i}.max
  end
  
=begin
  (19)
  В массиве чисел M(n) найти число (или числа), повторяющиеся масимальное количество раз.
=end
  
  def foundRepeatMax(arr)
    h = arr.uniq.inject({}){|h, v| h[v] = arr.count(v); h}
    max = h.max_by{|k, v| v}.last
    p h.select{|k, v| v == max}.keys
  end

=begin
  (20)
  Мажорнирующим??? элементом массива А[1..N] принято называть элемент, встречающийся в массиве более N/2 раз. Определите, есть ли такой элемент в массиве, если есть укажите его и его местонахождение

=end
  
  def major(arr)
    h = arr.uniq.inject({}){|h, v| h[v] = arr.count(v); h}
    q = h.select{|k, v| arr.size / 2 < v}
    return nil if q.empty?
    q
    
  end
  
end