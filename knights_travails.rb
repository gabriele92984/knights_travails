def knight_moves(start, target)
  # Define all possible knight moves
  moves = [[1, 2], [2, 1], [2, -1], [1, -2],
          [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  
  # Initialize BFS queue and visited set
  queue = [[start, [start]]]
  visited = {start => true}
  
  result = nil
  
  # Perform BFS search
  until queue.empty?
    current_position, path = queue.shift
    
    # Check if we've reached the target
    if current_position == target
      result = path
      break
    end
    
    # Explore all possible moves
    moves.each do |dx, dy|
      x = current_position[0] + dx
      y = current_position[1] + dy
      next_position = [x, y]
      
      # Validate position and check if visited
      if x.between?(0, 7) && y.between?(0, 7) && !visited[next_position]
        visited[next_position] = true
        queue << [next_position, path + [next_position]]
      end
    end
  end
  
  # Print formatted output
  puts "You made it in #{result.length - 1} moves! Here's your path:"
  result.each { |position| puts "  #{position}" }
  
  # Return the path array
  result
end
