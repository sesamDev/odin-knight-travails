require 'pry-byebug'
class Transform
  attr_accessor :position, :possible_moves, :parent, :start_pos

  def initialize(position, parent = nil, possible_moves = [])
    @position = position
    @possible_moves = possible_moves
    @parent = parent
    @start_pos = position
  end
end

class Knight_pawn
  attr_accessor :transform

  # Valid XY moves for a knight pawn
  @@MOVES = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]].freeze

  # Return array of possible moves
  def next_positions(current_position)
    result = []
    @@MOVES.each do |m|
      next if current_position[0] + m[0] < 0 || current_position[0] + m[0] > 7
      next if current_position[1] + m[1] < 0 || current_position[1] + m[1] > 7

      result << [current_position[0] + m[0], current_position[1] + m[1]]
    end
    result
  end

  # Call to initiate "game"
  def knight_moves(start_pos, target_pos)
    queue = []
    result = []
    current = Transform.new(start_pos)
    i = 0
    until current.position == target_pos
      current.possible_moves = next_positions(current.position)
      current.possible_moves.each { |child| queue << Transform.new(child, current) }
      current = queue.shift
    end

    history(current)
  end

  # Trace taken path and count number of steps taken.
  def history(current)
    # binding.pry
    result = []
    n_steps = 0
    until current.parent.nil?
      result << current.position
      n_steps += 1
      current = current.parent
    end
    result << current.start_pos
    result.reverse!
    puts "You made it in #{n_steps} Moves! Here\'s your path:"
    result.each_index { |i| print "#{result[i]}\n" }
  end
end

knight = Knight_pawn.new
knight.knight_moves([3, 3], [4, 3])
