=begin
  
A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent 5 hours on this challenge.


# Release 0: Pseudocode
# Outline:

# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)
  get a random letter by creating range for these letters and picking one at random
  get a random number in the range 1-100

# Check the called column for the number called.
  associate a column with the letter
  seacrh that column by
  iterating through rows and comparing to the element at the row's index=the column

# If the number is in the column, replace with an 'x'
  when the number is found, replace with "x"

# Display a column to the console
  We're never asked to do this in the Releases and I don't see how it would come up in gameplay so I'm not doing it but here's how:
    select column
    iterate through rows
    print (or puts) the element in the selected column for each row.

# Display the board to the console (prettily)
  I'm not good at pretty, but we'll print a row at a time with some stuff around it.
    print header line
    iterate through rows, printing each one in a pretty way (good spacing) with a vertical line at the start and finish
    print footer line to close the "box"
=end

# Initial Solution
=begin
  
class BingoBoard

  def initialize(board)
    @bingo_board = board
    @bingo = ["B","I","N","G","O"]
  end

  def call_letter
    @column = rand(5)
    @letter = @bingo[@column]
  end

  def call_number
    @number = rand(100) + 1
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
    print_h_line
    @bingo_board.each do |row|
      print_v_line
      row.each do |entry|
        case 
        when entry=="X"
          print "X"
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
end

#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE

board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]

first_game = BingoBoard.new(board)
p first_game.call
p first_game.display_board

=end

# Refactored Solution

class BingoBoard

  def initialize
    @players = {}
    @human = nil
    @bingo = ["B","I","N","G","O"]
    @win = false
    @who_got_call = []
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
    @letter + "-" + @number.to_s
  end

  def check (player, board)
    @who_got_call = [] if player == @human
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

  def play_bingo
    unless @human
      puts "What is your name?"
      @human = gets.chomp
    end
    @players[@human] = build_legal_board
    puts "Here is your board:"
    display_board (@players[@human])
    puts "How many computer players do you want?"
    players_to_add = gets.chomp.to_i
    player_num = 1
    while player_num <= players_to_add
      @players["Player " + player_num.to_s] = build_legal_board
      player_num += 1
    end
    take_turns until @win 
  end

  def take_turns
    print call
    print " . . . "
    @players.each do |player, board| 
      check(player, board)
      if @win
        @winner = player
        puts "#{@winner} won! Here is the winning board:"
        display_board (board)
        if player != @human
          puts "Sorry you lost.  Here is your board:"
          display_board(@players[@human])
        end
        puts "Would you like to play again?"
        if gets.chomp.downcase[0] == "y"
          @players = {}
          @win = false
          play_bingo
          return
        end
        puts "Thanks for playing. I hope you enjoyed the game!"
        return
      end
    end
    if @who_got_call != []
      print @who_got_call.join(",")
      puts " got that one!"
    end
  end

end

#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE

game = BingoBoard.new

game.play_bingo



##Reflection
=begin

###How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?
My version was basically a series of "write a method to do xxxx".  Most of those methods are so simple that more explanation seems excessive. I'm not sure this is optimal psuedocode, but I feel like it sets up what's needed pretty well.

###What are the benefits of using a class for this challenge?
The benefits were substantial because it allowed the "program" to be extremely simple readable language. I also like the class approach because it encourages writing short little methods that help readability.

###How can you access coordinates in a nested array?
You use a sequence of index numbers like `array_name[0][2][2]`.  I think that's a pain to write and I might create a `dig` method that allow you to write it as `array.dig([0,2,2])

###What methods did you use to access and modify the array?
Pretty simple: `#each`, `#each_with_index` and `#flatten`.  Each allows you to be destructive or not pretty easily and affect only what you want to affect.

###Give an example of a new method you learned while reviewing the Ruby docs. Based on what you see in the docs, what purpose does it serve, and how is it called?
I used `#flatten` for the first time here.  It converts a nested array to a one-dimensional array, which I needed when I was checking to see if the draw was a repeat of a previous number.

###How did you determine what should be an instance variable versus a local variable?
There were a number of variables I wanted to use across methods inside the object, so that I didn't even need to bring them out of the object (example: column number of the most recent draw).  Really the only local variables I used were clearly temporary within their method.

###What do you feel is most improved in your refactored solution?
While I was refactoring I realized I had a flaw in my draw and wasn't getting any draws in the 4th ("O") column because I misunderstood how `#rand(num)` works! Embarassing! But I added a LOT of features in refactoring.  I didn't rewrite any of the original code, it was pretty good to start with because I had broken it all down into pretty simple methods.
=end
