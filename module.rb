module Ghost

=begin
  (6)
  Написать программу, которая позволяет сжимать текст
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