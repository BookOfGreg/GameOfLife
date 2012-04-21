def rules state, alive_neighbours
  if state == :alive && alive_neighbours == 2
    return :alive
  elsif alive_neighbours == 3
    return :alive
  end
  :dead
end

class Cell
  attr_accessor :state, :neighbours
  
  def initialize starting_state
    @state = starting_state
    @neighbours = Array.new
  end
  
  def add_neighbour another_cell
    @neighbours << another_cell
  end
  
  def next_state
    rules @state, alive_neighbours
  end
  
  private
  def alive_neighbours
    count = 0
    @neighbours.each do |n|
      if n.state == :alive
        count += 1
      end
    end
    count
  end
end
