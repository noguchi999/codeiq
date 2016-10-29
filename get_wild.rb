if __FILE__ == $0

  def get_wild(args: "")
    args.each do |line|
      if line[/.+?xyz.*?/]
        print "get wild\n"
        exit
      else
        print "."
      end
    end
  end

  args = $stdin.read.split("\n")
  get_wild(args: args)
end