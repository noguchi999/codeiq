class RankSProblem

  def initialize(row: 1, column: 1, lines: [])
    @row    = row
    @column = column
    @lines  = lines
    @fields = lines_to_fields(row: row, column: column, lines: lines)
  end

  def play()
    p check_route
  end

private
  def is_barrier_free(lines: [])
    lines.find {|line| line == "#"}.nil?
  end

  def check_route()
    @fields.each_with_index do |horizontal_lines, row_index|
      if is_barrier_free(lines: horizontal_lines)
        return check_horizontal_line(row_index: row_index)
      end
    end

    @column.times do |column_index|
      vertical_lines = []
      @row.times do |row_index|
        vertical_lines.push @fields[row_index][column_index]
      end
      if is_barrier_free(lines: vertical_lines)
        return check_vertical_line(column_index: column_index)
      end
    end
  end

  def check_horizontal_line(row_index: 1)
    @column.times.reverse_each do |y|
      vertical_lines = []
      (row_index..(@row - 1)).each do |x|
        puts "row_index: #{row_index}, x: #{x}, y: #{y}"
        vertical_lines.push @fields[x][y]
      end
      if is_barrier_free(lines: vertical_lines)
        return [row_index, y]
      end
    end
  end

  def check_vertical_line(column_index: 1)
    @row.times.reverse_each do |x|
      horizontal_lines = []
      (column_index..(@column - 1)).each do |y|
        puts "column_index: #{column_index}, x: #{x}, y: #{y}"
        horizontal_lines.push @fields[x][y]
      end
      if is_barrier_free(lines: horizontal_lines)
        return [x, column_index]
      end
    end
  end

  def lines_to_fields(row: 1, column: 1, lines: [])
    fields = []
    row.times do |i|
      columns = []
      column.times do |j|
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
  RankSProblem.new(row: def_line[0].to_i, column: def_line[1].to_i, lines: args).play
end
