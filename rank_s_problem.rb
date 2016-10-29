class RankSProblem

  INF  = 100000000

  def initialize(width: 1, height: 1, lines: [])
    @left = [0, 1, 0, -1]
    @top  = [1, 0, -1, 0]
    @start = {left: 0, top: 0}
    @goal  = {left: width - 1, top: height - 1}

    @width  = width
    @height = height
    @distance = []
    @turn_count = []

    @maze = lines_to_fields(width: width, height: height, lines: lines)
  end

  def play()
    check_route
    p turn_counting
  end

private
  def check_route
    before

    queue = [@start]
    while queue.size > 0
      pos = queue.shift
      break if pos[:left] == @goal[:left] && pos[:top] == @goal[:top]

      4.times do |i|
        _left = pos[:left] + @left[i]
        _top  = pos[:top]  + @top[i]

        if _left >= 0 && _left < @width && _top >= 0 && _top < @height && @maze[_left][_top] != "#" && @distance[_left][_top] == INF
          queue << {left: _left, top: _top}
          @distance[_left][_top] = @distance[pos[:left]][pos[:top]] + 1
        end
      end
    end
    @distance[@goal[:left]][@goal[:top]]
  end

  def turn_counting
  end

  def before
    @width.times do |width|
      _distance = []
      _turn_count = []
      @height.times do |height|
        _distance << INF
        _turn_count << INF
      end
      @distance << _distance
      @turn_count << _turn_count
    end
    @distance[@start[:left]][@start[:top]] = 0
    @turn_count[@goal[:left]][@goal[:top]] = 0
  end

  def lines_to_fields(width: 1, height: 1, lines: [])
    fields = []
    width.times do |i|
      columns = []
      height.times do |j|
        columns.push lines[i][j]
      end
      fields[i] = columns
    end
    fields
  end
end

if __FILE__ == $0
  args = $stdin.read.split("\n")
  def_line = args.shift.split(" ")
  RankSProblem.new(width: def_line[0].to_i, height: def_line[1].to_i, lines: args).play
end
