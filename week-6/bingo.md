Hope it's okay to submit this as a `.md` file.  I think it's much easier to read, especially text that would otherwise scroll off the right side of the page like this line.

You can see (or better, copy so you can run) the Ruby file at this [link](https://github.com/JonClayton/phase-0/blob/master/week-6/bingo_solo_challenge_solution.rb)

Here's the refactored solution.  It's pretty cool since not only does it set up a random correct board (numbers in the right columns, no numbers repeating), but it plays a game, checking for victory, and shows the initial and final board along with all the moves and celebrations when the player has a particular number and when the player wins the game.  I've also introduced competition against as many computer players with separate boards as the player would like, and an option to replay the game.

```ruby
class BingoBoard

  def initialize
    @human_name = nil
    @bingo = ["B","I","N","G","O"]
    @who_got_call = []
    @possible_spaces = [[],[],[],[],[]]
    for col in (0..4)
      for row in (0..14)
        @possible_spaces[col][row] = col * 15 + row + 1
      end
    end
  end

  def refresh
    @balls = @possible_spaces.flatten.shuffle
    @win = false
    @boards = {}
  end

  def call    
    @number = @balls.pop
    @column = (@number-1)/15
    @bingo[@column] + "-" + @number.to_s
  end

  def check (player, board)
    @who_got_call = [] if player == @human_name
    board.each_with_index do |row, row_num|
      if row[@column] == @number
        board[row_num][@column] = "X"
        @who_got_call << player
        return
      end
    end
    check_for_win (board)
  end

  def display_board (board)
    print_BINGO_line
    board.each do |row|
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

  def check_for_win (board)
    check_rows (board)
    check_columns (board)
    check_diagonals (board)
    puts "BINGO I win I win I win!" if @win
  end

  def check_rows (board)
    board.each do |row|
      @win = true if row == ["X","X","X","X","X"]
    end
  end

  def check_columns (board)
    for col in 0..4 do
      five_in_a_row = true
      board.each do |row|
        five_in_a_row = false if row[col] != "X"
      end
      @win = true if five_in_a_row
    end
  end

  def check_diagonals (board)
    five_in_a_row = true
    for index in 0..4
      five_in_a_row = false if board[index][index] != "X"
    end
    @win = true if five_in_a_row
    for index in 0..4
      five_in_a_row = false if board[4-index][index] != "X"
    end
    @win = true if five_in_a_row
  end

  def build_legal_board
    column_pool = Array.new
    board = [[],[],[],[],[]]
    for col in (0..4)
      column_pool[col] = @possible_spaces[col].shuffle
      for row in (0..4)
        board[row][col] = column_pool[col].pop
      end
    end
    board[2][2] = "X"
    return board
  end

  def play_bingo
    refresh
    unless @human_name
      puts "What is your name?"
      @human_name = gets.chomp
    end
    @boards[@human_name] = build_legal_board
    puts "Here is your board:"
    display_board (@boards[@human_name])
    puts "How many computer players do you want?"
    players_to_add = gets.chomp.to_i
    player_num = 1
    while player_num <= players_to_add
      @boards["Player " + player_num.to_s] = build_legal_board
      player_num += 1
    end
    take_turn until @win 
  end

  def take_turn
    print call
    print " . . . "
    @boards.each do |player, board| 
      check(player, board)
      if @win
        puts "#{player} won! Here is the winning board:"
        display_board (board)
        if player != @human_name
          puts "Sorry you lost.  Here is your board:"
          display_board(@boards[@human_name])
        end
        puts "Would you like to play again?"
        gets.chomp.downcase[0] == "y" ? play_bingo : puts("Thanks for playing. I hope you enjoyed the game!")
        return
      end
    end
    if @who_got_call != []
      print @who_got_call.join(", ")
      puts " got that one!"
    end
  end

end

#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE

game = BingoBoard.new

game.play_bingo
```

##Reflection

###How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?
My version was basically a series of "write a method to do xxxx".  Most of those methods are so simple that more explanation seemed excessive. I'm not sure this is optimal psuedocode, but I feel like it sets up what's needed pretty well.  Then I added a lot of features in the refactoring process without going back to psuedocode

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
While I was refactoring I realized I had a flaw in my draw and wasn't getting any draws in the 4th ("O") column because I misunderstood how `#rand(num)` works! Embarassing! But I added a LOT of features in refactoring to turn it into a playable game.
