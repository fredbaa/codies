
class MatrixCounter
  attr_reader :matrix, :possibles

  TRIED = 2
  PATH = 3

  def initialize(matrix)
    @matrix = matrix
    @height = matrix.length
    @width = matrix.first.length
    @possibles = Array.new(@height){Array.new(@width)}
  end

  def count_lengths
    get_route(0,0)
    #present_route

    count = @possibles.inject(0) do |sum, row|
      cc = row.select{|a| a == PATH }.count
      sum += cc
    end
    puts "#{count} moves"
  end

  def present_route
    puts @matrix.inspect
    puts @possibles.inspect
  end

  def start_route
  end

  def get_route(row, col)
    return false if !valid?(row, col)

    if end?(row, col)
      @possibles[row][col] = PATH
      return true
    else
      @possibles[row][col] = TRIED
    end

    # NORTH
    if get_route(row-1, col)
      @possibles[row-1][col] = PATH
      return true
    end

    # EAST
    if get_route(row, col+1)
      @possibles[row][col+1] = PATH
      return true
    end

    # SOUTH
    if get_route(row+1, col)
      @possibles[row+1][col] = PATH
      return true
    end

    # WEST
    if get_route(row, col-1)
      @possibles[row][col-1] = PATH
      return true
    end

    return false
  end

  def end?(row, col)
    return row == (@height - 1) &&
           col == (@width - 1)
  end

  def valid?(row, col)
    return in_range?(row, col) && open?(row, col) && !tried?(row, col)
  end

  def open?(row, col)
    return @matrix[row][col] == 1
  end

  def tried?(row, col)
    return @possibles[row][col] == TRIED
  end

  def in_range?(row, col)
    return (row >= 0 && row < @height) && (col >= 0 && col < @width)
  end
end

data = [[1, 1, 1, 1], [0, 0, 0, 1], [1, 1, 1, 1], [1, 0, 0, 0], [1, 1, 1, 1]]
data.each do |d|
  d.each do |x|
    print "#{x} "
  end
  puts ""
end
MatrixCounter.new(data).count_lengths
