 /* Design Basic Game Solo Challenge

// This is a solo challenge

Your mission description:
Overall mission: win at checkers
Goals: move ahead.  In later versions, jump, be kinged, etc.
Characters: Red team and black team (X and O in the ASCII version)
Objects: Each useable square on board will be an object held within the board array, with properties.
Functions: display board, and ask for/implement move.  Later, check for win, make move for computer player.

Pseudocode for MVP
build function for ASCII graphic depiction of 8x8 checkers board with ---- on unplayable spaces and open spaces have a space number along with " " or "X" or "O" to show whether they are open or occupied and by which team
- draw top line
- draw each row
  - draw side vertical line
  - draw contents of square
    - determine whether playable square
    - get state of square from board state object
    - format square with space number and state
  - draw interior vertical line
  - repeat to complete row
  - draw side line
- draw bottom line

build array of objects to store board state (open, X or O spaces)
- initalize with 32 objects, one for each square, by number (0 index element is a null)
- Property: owner, with  squares 1-12 are black (X), squares 13-20 are empty (-), and squares 21-32 are red (O)
- Property: upward moves (to higher numbers)
- Property: downward moves (to lower number)

build function to ask for and implement move for each player
- ask player which piece he wants to move
- look up piece on board
  - check color
  - based on color, check spaces it could move to
  - check whether spaces are open
    - if only one, make move
    - if two open, ask which one he wants to move to
    - if none open, ask for different piece to move
  - change board to reflect outcome of move
    - change owner of old space to nobody
    - change owner of new space to mover
- print board

- later improvements:
  - jump moves
  - additional jumps on same move if available
  - taking turns
  - kinging and reversible movement as a result
  - visual display of board
  - click entry to move and destination
  - automatic analysis of which pieces can move and when clicked, where they can move to
  - display available moves by flashing piece, and destinations when piece is clicked
  - AI so you can play against the computer
    - initially, random choice among available moves
    - improve AI with following rules
    - avoid moving last row
    - get kinged when possible
    - take jumps when possible
    - avoid moving out of unjumpable positions
    - avoid moving into jumpable positions
    - develop deeper analysis of position
      -  recursive evaluation of future moves?
      -  method to recognize better positions?
      -  other ways to assess value of moves that I haven't thought of yet.

// Initial Code






// Refactored Code






// Reflection
//
//
//
//
//
//
//
//