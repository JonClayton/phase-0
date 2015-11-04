Hope it's okay to submit this as a `.md` file.  I think it's much easier to read, especially text that would otherwise scroll off the right side of the page like this line.

You can see (or better, copy so you can run) the Ruby file at this [link](https://github.com/JonClayton/phase-0/blob/master/week-6/bingo_solo_challenge_solution.rb)

Here's the refactored solution.  It's pretty cool since not only does it set up a random correct board (numbers in the right columns, no numbers repeating), but it plays a game, checking for victory, and shows the initial and final board along with all the moves and celebrations when the player has a particular number and when the player wins the game.

```ruby
class BingoBoard

  attr_reader :win

  def initialize
    @bingo_board = build_legal_board
    @bingo = ["B","I","N","G","O"]
    @win = false
    display_board
  end

  def call_letter
    @column = rand(5)
    @letter = @bingo[@column]
  end

  def call_number
    @number = @column*15 + rand(15) + 1
  end

  def call    
    call_letter
    call_number
    "#{@letter}-#{@number}"
  end

  def check
    @bingo_board.each_with_index do |row, row_num|
      if row[@column] == @number
        @bingo_board[row_num][@column] = "X"
        puts "Got that one!"
      end
    end
  end

  def display_board
    print_BINGO_line
    @bingo_board.each do |row|
      print_v_line
      row.each do |entry|
        case 
        when entry=="X"
          print " X "
        when entry < 10
          print " #{entry} "
        when entry == 100
          print entry
        else 
          print " #{entry}"
        end
      end
        print_v_line
        puts
    end
      print_h_line
  end

  def print_v_line
    print "|"
  end

  def print_h_line
    puts "-----------------"
  end

  def print_BINGO_line
    puts "--B--I--N--G--O--"
  end

  def check_for_win
    check_rows
    check_columns
    check_diagonals
    puts "BINGO I win I win I win!" if win
  end

  def check_rows
    @bingo_board.each do |row|
      @win = true if row == ["X","X","X","X","X"]
    end
  end

  def check_columns
    for col in 0..4 do
      five_in_a_row = true
      @bingo_board.each do |row|
        five_in_a_row = false if row[col] != "X"
      end
      @win = true if five_in_a_row
    end
  end

  def check_diagonals
    five_in_a_row = true
    for index in 0..4
      five_in_a_row = false if @bingo_board[index][index] != "X"
    end
    @win = true if five_in_a_row
    for index in 0..4
      five_in_a_row = false if @bingo_board[4-index][index] != "X"
    end
    @win = true if five_in_a_row
  end

  def draw_a_ball
    p call
    check
    check_for_win
  end

  def rand_num_not_used_already(board,col)
    candidate = rand(15)+1+15*col
    board.flatten.include?(candidate) ? rand_num_not_used_already(board,col) : candidate
  end

  def build_legal_board
    board = [[],[],[],[],[]]
    row = 0
    while row < 5
      col = 0
      while col < 5
        board[row][col] = rand_num_not_used_already(board,col)
        col += 1
      end
      row += 1
    end
    board[2][2] = "X"
    return board
  end
end

#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE

game = BingoBoard.new

until game.win
  game.draw_a_ball
end
game.display_board
```

##Reflection

###How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?
My version was basically a series of "write a method to do xxxx".  Most of those methods are so simple that more explanation seems excessive. I'm not sure this is optimal psuedocode, but I feel like it sets up what's needed pretty well.

###What are the benefits of using a class for this challenge?
The benefits were substantial because it allowed the "program" to be extremely simple readable language. I also like the class approach because it encourages writing short little methods that help readability.

###How can you access coordinates in a nested array?
You use a sequence of index numbers like `array_name[0][2][2]`.  I think that's a pain to write and I might create a `dig` method that allow you to write it as `array.dig([0,2,2])`

###What methods did you use to access and modify the array?
Pretty simple: `#each`, `#each_with_index` and `#flatten`.  Each allows you to be destructive or not pretty easily and affect only what you want to affect.

###Give an example of a new method you learned while reviewing the Ruby docs. Based on what you see in the docs, what purpose does it serve, and how is it called?
I used `#flatten` for the first time here.  It converts a nested array to a one-dimensional array, which I needed when I was checking to see if the draw was a repeat of a previous number.

###How did you determine what should be an instance variable versus a local variable?
There were a number of variables I wanted to use across methods inside the object, so that I didn't even need to bring them out of the object (example: column number of the most recent draw).  Really the only local variables I used were clearly temporary within their method.

###What do you feel is most improved in your refactored solution?
While I was refactoring I realized I had a flaw in my draw and wasn't getting any draws in the 4th ("O") column because I misunderstood how `#rand(num)` works! Embarassing! But I added a LOT of features in refactoring.  I didn't rewrite any of the original code, it was pretty good to start with because I had broken it all down into pretty simple methods.