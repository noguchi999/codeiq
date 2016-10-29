require 'optparse'

if __FILE__ == $0
  opt = OptionParser.new
  opts = {}
  opt.on('-n height') {|v| opts[:n] = v }
  opt.on('-m width') {|v| opts[:m] = v }
  opt.parse!(ARGV)
  # Usage: ruby lake_counting.rb -n 10 -m 12
   
  @height = opts[:n].to_i
  @width  = opts[:m].to_i
  @field  = []
 
  def build_lake
    @width.times do
      _heights = []
      @height.times do
        _heights << (rand(100) >= 75 ? "W" : ".")
      end
      @field << _heights
    end
  end
 
  def depth_first_search(x, y)
    @field[x][y] = "."
     
    (-1..1).each do |dx|
      (-1..1).each do |dy|
        left = x + dx
        top  = y + dy
         
        if left >= 0 && left < @width && top >= 0 && top < @height && @field[left][top] == "W"
          depth_first_search(left, top)
        end
      end
    end
  end
 
  build_lake
  @width.times do |x|
    puts @field[x].join("")
  end
   
  lake_count = 0
  @width.times do |x|
    @height.times do |y|
      if @field[x][y] == "W"
        depth_first_search(x, y) 
        lake_count += 1
      end
    end
  end
     
  puts lake_count
end