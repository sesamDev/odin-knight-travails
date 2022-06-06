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
  attr_accessor :v_moves, :h_moves

  def initialize
    @v_moves = {
      forward: 2,
      back: -2
    }
    @h_moves = {
      left: -1,
      right: 1
    }
  end

  def knight_moves(origin, dest)
    # code here
  end

  # Currently finds all possible moves from one position
  # Does not take out of board into consideration
  def possible_moves(_board)
    origin = [4, 4]
    valid_moves = []
    v_moves.each_key do |v|
      h_moves.each_key do |h|
        p valid_moves << [origin [0] + h_moves[h], origin[1] + v_moves[v]]
      end
    end
    v_moves.each_key do |v|
      h_moves.each_key do |h|
        p valid_moves << [origin [0] + v_moves[v], origin[1] + h_moves[h]]
      end
    end
  end
end

knight = KnightPawn.new
knight.possible_moves(board)
