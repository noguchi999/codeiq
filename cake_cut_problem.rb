if __FILE__ == $0

  def cutting(num_of_reamin: 0, length_of_cake: 0, cut_size: 0)
    return if num_of_reamin == 0

    length_of_cake.times do |cut_size|
      @packs.push cut_size
      if @packs.length == @pack_size
        @pieces.push @packs
        @packs = []
      end
      cutting(num_of_reamin: num_of_reamin - 1, length_of_cake: length_of_cake - cut_size)
    end
    @pieces.push @packs unless @packs.empty?
  end

  def cake_cut_problem(num_of_member: 3, length_of_cake: 5, limit_delta: 1)
    @pieces = []
    @packs = []
    @pack_size = num_of_member - 1
    
    cutting(num_of_reamin: num_of_member, length_of_cake: length_of_cake)

    results = []  
    @pieces.each do |pack|
      new_pack = ([length_of_cake - pack.inject(:+)] + pack)
      if new_pack.max - new_pack.min <= limit_delta
        results.push new_pack
      end
    end

    results.uniq!
    p results.sort
    puts results.length
  end

  # cake_cut_problem(num_of_member: 5, length_of_cake: 5, limit_delta:1)
  while line = $stdin.gets
    args = line.split(" ")
    cake_cut_problem(num_of_member: args[0].to_i, length_of_cake: args[1].to_i, limit_delta:args[2].to_i)
  end
end