if __FILE__ == $0

  def paper_rock_scissors_problem(line: "")
    NUMBERS.each do |k, v|
      line.gsub(/#{k.to_s}/, v)
  end

  while line = $stdin.gets
    paper_rock_scissors_problem line: line 
  end
end