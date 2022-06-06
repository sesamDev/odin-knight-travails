board = [8, 8]
count = 0
board[0].times do |x|
  board[1].times do |y|
    p "#{x} #{y}"
    count += 1
  end
end
p count

class KnightPawn
  attr_accessor :y_moves, :x_moves

  def initialize
    @y_moves = {
      forward: 2,
      back: -2
    }
    @x_moves = {
      left: -1,
      right: 1
    }
  end

  def knight_moves(origin, dest)
    # code here
  end

  # Currently finds all possible moves from one position
  def possible_moves(_board)
    origin = [4, 0]
    valid_movesXY = []
    y_moves.each_key do |y|
      x_moves.each_key do |x|
        next if origin [0] + x_moves[x] > 7 || origin [0] + x_moves[x] < 0
        next if origin[1] + y_moves[y] > 7 || origin[1] + y_moves[y] < 0

        valid_movesXY << [origin [0] + x_moves[x], origin[1] + y_moves[y]]
      end
    end
    y_moves.each_key do |y|
      x_moves.each_key do |x|
        next if origin [0] + y_moves[y] > 7 || origin [0] + y_moves[y] < 0
        next if origin[1] + x_moves[x] > 7 || origin[1] + x_moves[x] < 0

        valid_movesXY << [origin [0] + y_moves[y], origin[1] + x_moves[x]]
      end
    end
    p valid_movesXY
  end
end

knight = KnightPawn.new
knight.possible_moves(board)
