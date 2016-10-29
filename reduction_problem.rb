if __FILE__ == $0

  def reduction_problem(args: [])
    rationals = []
    args.each do |line|
      rationals.push Rational(line)
    end
    lcm = rationals[0].denominator.lcm rationals[1].denominator
    reduction_1 = Rational(rationals[0].numerator * (lcm / rationals[0].denominator), lcm)
    reduction_2 = Rational(rationals[1].numerator * (lcm / rationals[1].denominator), lcm)

    result = reduction_1 + reduction_2
    if result.denominator == 1
      puts result.to_i
    else
      puts result
    end 
  end

  args = $stdin.read.split("\n")
  reduction_problem(args: args)
end