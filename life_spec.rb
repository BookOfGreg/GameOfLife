require "./life.rb"

describe "rules" do
  describe "alive" do
    it "should have a unit die with less than 2 neighbours" do
      state = :alive
      alive_neighbours = 1
      rules(state, alive_neighbours).should == :dead
    end
    it "should have a unit live with 2 or 3 neighbours" do
      state = :alive
      alive_neighbours = 2
      rules(state, alive_neighbours).should == :alive
      state = :alive
      alive_neighbours = 3
      rules(state, alive_neighbours).should == :alive
    end
    it "should have a unit die with more than 3 neighbours" do
      state = :alive
      alive_neighbours = 4
      rules(state, alive_neighbours).should == :dead
    end
  end
  describe "dead" do
    it "should have a unit come to life with 3 neighbours" do
      state = :dead
      alive_neighbours = 3
      rules(state, alive_neighbours).should == :alive
    end
  end
end

describe "cell" do
  it "knows its current state" do
    cell = Cell.new(:alive)
    cell.state.should == :alive
  end
  it "knows its neighbours" do #test for helper 'test_add_neighbour'
    cell = Cell.new(:alive)
    cell2 = Cell.new(:alive)
    cell.add_neighbour cell2
    cell.neighbours.should == [cell2]
  end
  it "knows its next state" do
    cell = test_add_neighbour :alive, 10, 2
    cell.next_state.should == :alive
    cell = test_add_neighbour :alive, 10, 1
    cell.next_state.should == :dead
  end
end


#tested by 'knows its neighbours'
def test_add_neighbour state, cells, alive
  cell = Cell.new(state)
  (0..cells).each do
    if alive > 0
      newCell = Cell.new(:alive)
      alive -= 1
    else
      newCell = Cell.new(:dead)
    end
    newCell.add_neighbour cell
    cell.add_neighbour newCell
  end
  cell
end

Made some changes