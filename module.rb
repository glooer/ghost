module Ghost

=begin
  (1)
  "Считалка". N ребят располагаются по кругу. Отсчет начинают от первого, удаляют каждого k-го, смыкая круг после каждого удаления. Определите порядок удаления ребят из круга. Замечание. Если k>0, то отсчет ведется по часовой стрелке, иначе против часовой
=end

  def rhyme(n = 10, k = 11)
    arr = (1..n).to_a
    
    res = []
    i = 0
    while k.abs < arr.size
      i = (i + arr.size + k) % arr.size
      res << arr.delete_at(i)
    end
    res += arr
    p res
  end

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
=end

  def compress(str)
    str.gsub(/(.)\1{2,}/){ |v| "#{v[0]}(#{v.size})" }
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
  (8) 
  Напишите программу построения латинского квадрата. 
  Латинский квадрат – матрица NxN, элементы которой выбраны от 1 до N так, что каждое число встречается только один раз в каждой строке и в каждом столбце. 
  Циклический сдвиг осуществляется в отдельной процедуре. 
  Пример латинского квадрата порядка 3: 
  1 2 3 
  3 2 1 
  2 3 1 
  или 
  2 1 3 
  3 1 2 
  1 3 2
=end
 
  def latinSquares(n = 9)
    Array.new(n){|i| Array.new(n){|v| v + 1}.rotate(i)}
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
  (11)
  Напишите программу, которая проверяет, является ли заданная целочисленная квадратная матрица L (n, n) магическим квадратом, 
  т.е. сумма элементов матрицы по строкам, по столбцам и по диагоналям одинакова.
=end

  def magicSquare(arr)
    return false if arr.size != arr.first.size
    
    sm = sp = 0
    for i in (0...arr.size)
      sm += arr[i][i]
      sp += arr[-i][-i]
    end #проверили диагонали
    return false if sm != sp
    
    for i in (0...arr.size)
      sr = sc = 0
      for j in (0...arr[i].size)
        sr += arr[i][j]
        sc += arr[j][i]
      end
      return false if sr != sm or sc != sm
    end
    
    return true
  end
  
=begin
  (12)
  Программа должна распознавать вид введенной информации 
  (русские буквы, латинские буквы, большие буквы, малые буквы, положительное число, отрицательное число, 
    целое число, вещественное число или комбинация из всех указанных).
    
    
  FIXME часть не работает
=end

  def rec(str = "уц -2 а")
    res = []
    res << "Русские буквы" if !str[/[А-Я]+/i].nil?
    res << "Латинские буквы" if !str[/[A-Z]/i].nil?
    res << "Большие буквы" if !str[/[A-ZА-Я]/].nil?
    res << "Малые буквы" if !str[/[a-zа-я]/].nil?
    res << "Положительное число" if !str[/[^\-]\d+/].nil? #хз как, видимо if надо...
    res << "Отрицательное число" if !str[/-\d+/].nil?
    res << "Целое число" if !str[/\d+\.[\D]/].nil?
    res << "Вещестенное число" if !str[/\d+\.\D+/].nil? # и тут тоже
    res
  end
  
=begin
  (13)
  Составьте программу для нахождения автоморфных чисел в отрезке [m,n].
  Автоморфным числом называется число, которое равно последним числам своего кадрата. Например 5 ** 2 = 25, 6 ** 2 = 36, 25 ** 2 = 625
=end

  def automorph(m, n)
    res = []
    for i in (m..n)
      res << i if (i ** 2).to_s[/#{i.to_s}$/]
    end
    res
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
  
=begin
  (27) 
  Напишите программу нахождения разложения целого числа m на простые множители. 
  Все простые множители требуется вывести в порядке возрастания.
=end

  def factorization(n = 65566)
    res = []
    i = 2
    while n > 1
      while n % i == 0
        n /= i
        res << i
      end
      i += 1
    end
    p res  
  end
  
=begin
  (24) 
  Число из n цифр называется числом Армстронга, если сумма его цифр в степени n равна самому числу. 
  Например: 1634 = 14 + 64 + 34 + 44. Составить программу, находящую все числа Армстронга среди двузначных и трехзначных чисел.
=end  
  
  def armstrong(istart = 10, iend = 999)
    def darmstrong?(d)
      d.to_s.split("").inject(0){|z, v| z + v.to_i ** d.to_s.size} == d
    end
    (istart..iend).select{|v| darmstrong?(v)}
  end

=begin
  (28) 
  Составить программу нахождения цифрового корня натурального числа. 
  Цифровой корень числа получается следующим образом. 
  Складываем все цифры этого числа, затем все цифры найденной суммы и повторяем процесс до тех пор, 
  пока в результате не будет получено однозначное число (цифра), 
  которое и называется цифровой корень данного числа.
=end 

  def digitalsqrt(n)
    while n > 10
      n = n.to_s.split("").inject(0){|z, v| z + v.to_i}
    end
    n
  end
  
=begin
  (29) 
  Натуральное число называется совершенным, если оно равно сумме всех своих делителей, включая единицу и исключая себя. 
  Например, 6=1+2+3 – число совершенное. Вывести первые N (N<5) совершенных чисел на экран.
=end

  def perfectNumbers(n = 4)
    p "это будет долго..." if n > 4
    res = []
    i = 6
    while n > 0
      sum = 1
      2.step(i - 1) {|v| sum += v if i % v == 0}
      if sum == i
        res << i
        n -= 1
      end
      i += 1
    end
    p res
  end
  
=begin
  (35) 
  Из данного предложения выбрать и напечатать слова, превышающие заданное количество букв, с указанием количества символов слова.
=end  

  def charsInWords(str, n = 5)
    escChar = ",.!"
    str.tr(escChar, "").split.select{|v| v.size > n}.map{|v| "#{v} - #{v.size}"}  
  end
  
=begin
  (38)
  Перегруппировать элементы массива A(n) следующим образом: 
  в начале массива – все отрицательные, 
  затем – нулевые и в концеs – все положительные элементы (с сохранением порядка следования в каждой группе).
=end

  def sortq(arr)
    a, b = arr.partition{|v| v >= 0}
    (b + a.partition{|v| v == 0}).flatten
  end
  
=begin
  (40) 
  Даны два массива целых чисел А и В, упорядоченные по возрастанию. 
  Поместить все элементы этих массивов в массив С, который также должен быть упорядочен по возрастанию. 
  Сортировать массив С нельзя!
=end  

  def unionab(a, b)
    def un(a, b, res)
      return res + b if a.empty?
      return res + a if b.empty?
      
      if a[0] < b[0]
        un(a[1..-1], b, res << a[0])
      else
        un(a, b[1..-1], res << b[0])
      end
    end
    
    return un(a, b, [])
  end
  
end