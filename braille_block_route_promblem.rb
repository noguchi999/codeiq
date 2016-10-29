class BrailleBlockRouteProblem

  def initialize(line_braille_block: 0, dot_braille_block: 0)
    @line_braille_block = line_braille_block
    @dot_braille_block  = dot_braille_block
  end

  def play()
    puts check_route
  end

private
  def check_route()
  end
end

if __FILE__ == $0
  args = $stdin.read.split("\n")[0].split(" ")
  BrailleBlockRouteProblem.new(line_braille_block: args[0], dot_braille_block: args[1]).play
end
