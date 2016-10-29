require File.expand_path('../rank_s_problem', __FILE__)

if __FILE__ == $0
  args = ["..#..", "...#.", ".....", "..##.", "..#.."]
  def_line = [5, 5]

  RankSProblem.new(width: def_line[0].to_i, height: def_line[1].to_i, lines: args).play
end
