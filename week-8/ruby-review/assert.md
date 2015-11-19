This is in Markdown so it can be read more easily.  If you'd like to see the `.rb`version with all commentary it is [here](https://github.com/JonClayton/phase-0/blob/master/week-8/ruby-review/assert.rb).

I did the Assert exercise, with the bingo_2 exercise as the background for using the assert technique.  It wasn't a big deal since I had done the "win checking" in my original bingo solution.  Here's the code.  I've compressed some lines to make it a little less long.
```ruby
# sample boards
 horizontal = [[47, 44, 71, 8, 88],['x', 'x', 'x', 'x', 'x'],[83, 85, 97, 89, 57],[25, 31, 96, 68, 51],[75, 70, 54, 80, 83]]
 vertical = [[47, 44, 71, 'x', 88],[22, 69, 75, 'x', 73],[83, 85, 97, 'x', 57],[25, 31, 96, 'x', 51],[75, 70, 54, 'x', 83]]
 right_to_left = [['x', 44, 71, 8, 88],[22, 'x', 75, 65, 73],[83, 85, 'x', 89, 57],[25, 31, 96, 'x', 51],[75, 70, 54, 80, 'x']]
 left_to_right = [[47, 44, 71, 8, 'x'],[22, 69, 75, 'x', 73],[83, 85, 'x', 89, 57],[25, 'x', 96, 68, 51],['x', 70, 54, 80, 83]]
 stamp = [[47, 44, 71, 8, 2],[22, 69, 75, 'x', 73],[83, 85, 'x', 89, 57],['x', 'x', 96, 68, 51],['x', 'x', 54, 80, 83]]
 inside = [[47, 44, 71, 8, 2],[22, 'x', 75, 'x', 73],[83, 85, 'x', 89, 57],[25, 'x', 96, 'x', 51],['x', 70, 54, 80, 83]]
 outside = [['x', 44, 71, 8, 'x'],[22, 69, 75, 2, 73],[83, 85, 'x', 89, 57],[25, 'x', 96, 68, 51],['x', 70, 54, 80, 'x']]
 cross = [[47, 44, 71, 8, 2],[22, 69, 'x', 'x', 73],[83, 'x', 'x', 'x', 57],[25, 'x', 'x', 68, 51],['x', 70, 54, 80, 83]]

class BingoScorer

  def check_for_win (board)
  	@board = board
    check_rows || check_columns || check_diagonals || check_other_wins
  end

  def check_rows
    @board.each do |row|
      return true if row == ["x","x","x","x","x"]
    end
    false
  end

  def check_columns
    for col in 0..4 do
      five_in_a_row = true
      @board.each do |row|
        five_in_a_row = false if row[col] != "x"
      end
      return true if five_in_a_row
    end
    false
  end

  def check_diagonals
    five_in_a_row = true
    for index in 0..4
      five_in_a_row = false if @board[index][index] != "x"
    end
    return true if five_in_a_row
    five_in_a_row = true
    for index in 0..4
      five_in_a_row = false if @board[4-index][index] != "x"
    end
    five_in_a_row
  end

  def check_other_wins
  	patterns = [[[1,1],[1,3],[3,1],[3,3]],[[3,0],[3,1],[4,0],[4,1]],[[1,2],[2,1],[2,3],[3,2]],[[0,0],[0,4],[4,0],[4,4]]]
  	patterns.each do |pattern|
  		five_in_a_row = true
  		pattern.each {|rowCol| five_in_a_row = false if @board[rowCol[0]][rowCol[1]] != "x"}
  		return true if five_in_a_row
  	end
    false
  end
end

game= BingoScorer.new

def assert
  raise "Assertion failed!" unless yield
  puts "Test passed"
end

samples= [horizontal,vertical,right_to_left,left_to_right,stamp,inside,outside,cross]
samples.each do |board|
	assert {game.check_for_win(board)}
end
```
### Reflection
####What concepts did you review or learn in this challenge?
I had already done the "check for win" in the original bingo challenge, but this incorporates the Assert challenge too.
####What is still confusing to you about Ruby?
My biggest challenge was actually syntax since I've been getting used to JavaScript
####What are you going to study to get more prepared for Phase 1?
I will do all the optional challenges, go back and redo CSS positioning since that's weak spot, clean up my webpage to make it much better, and I expect to read all of Eloquent JavaScript, which I think is a great, great book (I gave the author some money!)
