require 'prime'

if __FILE__ == $0

  def prime_check(limit: 30, unit: 5, length: 2)
    results = []
    Prime.each(limit).each do |prime|
      index = (prime-1)/unit
      results[index] = results[index] ? results[index] += "*" : "*" 
    end
    
    l, u = 0, 0
    results.each_with_index do |v, index|
      u = (index + 1) * unit 
      l = u - (unit - 1)
      puts %Q|#{"%0#{length}d"%l}-#{"%0#{length}d"%u}:#{v}|
    end
  end

  while line = $stdin.gets
    args = line.split(" ")
    prime_check(limit: args[0].to_i, unit: args[1].to_i, length:args[0].length) 
  end
end