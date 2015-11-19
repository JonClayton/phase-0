# Create a Bingo Scorer (SOLO CHALLENGE)

# I spent [#] hours on this challenge.

# Pseudocode
# I don't really need to write this since I including win checking in 
# my original solution. But here goes:
#-- create a master method that runs methods that check for each of the possible winning patterns
#-- check for horizontal wins by iterating through the rows, which are each an array, to see if the array is xxxxx
#-- check for vertical wins by doing a nested iteration by column (index number) and rows (elements of the board array) to see if there is an 'x' in the same column in each row
#-- check for diagonal wins by iterating through rows and seeing if there is an 'x' in the appropriate column for either of the two types of wins
#-  check for each of the other win states with very specific search since they are each unique.
#- in each case it is more efficient to start with a tracker variable that assumes win=true and then end the method when that is proved false or return true if it is not proved false.

# sample boards

 horizontal = [[47, 44, 71, 8, 88],
               ['x', 'x', 'x', 'x', 'x'],
               [83, 85, 97, 89, 57],
               [25, 31, 96, 68, 51],
               [75, 70, 54, 80, 83]]

 vertical = [[47, 44, 71, 'x', 88],
             [22, 69, 75, 'x', 73],
             [83, 85, 97, 'x', 57],
             [25, 31, 96, 'x', 51],
             [75, 70, 54, 'x', 83]]


 right_to_left = [['x', 44, 71, 8, 88],
                 [22, 'x', 75, 65, 73],
                  [83, 85, 'x', 89, 57],
                  [25, 31, 96, 'x', 51],
                  [75, 70, 54, 80, 'x']]


 left_to_right = [[47, 44, 71, 8, 'x'],
                   [22, 69, 75, 'x', 73],
                   [83, 85, 'x', 89, 57],
                   [25, 'x', 96, 68, 51],
                   ['x', 70, 54, 80, 83]]

 stamp = [[47, 44, 71, 8, 2],
                   [22, 69, 75, 'x', 73],
                   [83, 85, 'x', 89, 57],
                   ['x', 'x', 96, 68, 51],
                   ['x', 'x', 54, 80, 83]]


 inside = [[47, 44, 71, 8, 2],
                   [22, 'x', 75, 'x', 73],
                   [83, 85, 'x', 89, 57],
                   [25, 'x', 96, 'x', 51],
                   ['x', 70, 54, 80, 83]]

 outside = [['x', 44, 71, 8, 'x'],
                   [22, 69, 75, 2, 73],
                   [83, 85, 'x', 89, 57],
                   [25, 'x', 96, 68, 51],
                   ['x', 70, 54, 80, 'x']]

 cross = [[47, 44, 71, 8, 2],
                   [22, 69, 'x', 'x', 73],
                   [83, 'x', 'x', 'x', 57],
                   [25, 'x', 'x', 68, 51],
                   ['x', 70, 54, 80, 83]]

# Initial Solution
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
# samples= [horizontal,vertical,right_to_left,left_to_right,stamp,inside,outside,cross]
# samples.each do |board|
#   puts game.check_for_win(board)
# end

# Refactored Solution

# Don't think this needs refactoring


# DRIVER TESTS GO BELOW THIS LINE
# implement tests for each of the methods here:

def assert
  raise "Assertion failed!" unless yield
  puts "Test passed"
end

samples= [horizontal,vertical,right_to_left,left_to_right,stamp,inside,outside,cross]
samples.each do |board|
	assert {game.check_for_win(board)}
end

=begin
### Reflection
####What concepts did you review or learn in this challenge?
I had already done the "check for win" in the original bingo challenge, but this incorporates the Assert challenge too.

####What is still confusing to you about Ruby?
####What are you going to study to get more prepared for Phase 1?
=end