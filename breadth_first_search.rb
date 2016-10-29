class BreadthFirstSearch

  INF  = 100000000

  def initialize(width: 0, height: 0)
    @distance = []
    @left = [0, 1, 0, -1]
    @top  = [1, 0, -1, 0]

    @width  = width
    @height = height

    @maze = build_maze(width: width, height: height)
  end

  def play
    puts bfs
  end

private
  def build_maze(width: 0, height: 0)
    _maze = []
    width.times do
      tier = []
      height.times do
        tier << (rand(100) > 70 ? "#" : ".")
      end
      _maze << tier
    end

    @start = {left: 0, top: 1} # テスト用に固定値
    @goal  = {left: 9, top: 8} # テスト用に固定値
    # テスト用に固定値
    _maze = []
    _maze << %w(# S # # # # # # . #)
    _maze << %w(. . . . . . # . . #)
    _maze << %w(. # . # # . # # . #)
    _maze << %w(. # . . . . . . . .)
    _maze << %w(# # . # # . # # # #)
    _maze << %w(. . . . # . . . . #)
    _maze << %w(# # # # # # # # . #)
    _maze << %w(. . . . # . . . . .)
    _maze << %w(. # # # # . # # # .)
    _maze << %w(. . . . # . . . G #)

    _maze
  end

  def bfs
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

  def before
    @width.times do |width|
      _distance = []
      @height.times do |height|
        _distance << INF
      end
      @distance << _distance
    end
    @distance[@start[:left]][@start[:top]] = 0
  end
end

if __FILE__ == $0
  BreadthFirstSearch.new(width: 10, height: 10).play
end
