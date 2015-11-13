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
*/
var hLine = "-------------------------------------------------------------------";

function SquareLineOutput(row,col,line) {
  if ((row+col)%2==0) return "-------|";
  var space=(8-row)*4+(Math.ceil(col/2))
  var spaceString = " " + space.toString();
  var owner = board[space].owner
  if (space < 10) spaceString = " "+spaceString;
  if (line<3) spaceString = owner+owner+owner;
  return owner+owner+owner+owner+spaceString+"|";
}

function PrintBoard() {
  console.log(hLine);
  for(var row = 1; row < 9; row++) {
    for (var line = 1; line < 4; line++) {
      var lineString = ("||");
      for (var col = 1; col < 9; col++) {
        lineString += SquareLineOutput(row,col,line); //add contents of line within square
      }
      lineString += ("|");
      console.log(lineString);
    }
    console.log(hLine);
  }
}

var board = []

function Space (number, owner) {
  this.name = "space" + number.toString();
  this.owner = owner;
  this.upMoves = [];
  this.downMoves = [];
}
function InitializeBoard() {
  for (space =1; space < 33; space++) {
    var owner = " "
    if (space < 13) owner = "X";
    if (space > 20) owner = "O";
    board[space] = new Space (space, owner);
  }
  board[1].upMoves = [5];
  board[2].upMoves = [5,6];
  board[3].upMoves = [6,7];
  board[4].upMoves = [7,8];
  board[5].upMoves = [9,10];
  board[6].upMoves = [10,11];
  board[7].upMoves = [11,12];
  board[8].upMoves = [12];
  for (var space = 9; space < 29; space++) {
    board[space].upMoves[0] = board[space-8].upMoves[0]+8;
    if (board[space-8].upMoves[1]>0) board[space].upMoves[1] = board[space-8].upMoves[1]+8;
  }
  board[5].downMoves = [1,2];
  board[6].downMoves = [2,3];
  board[7].downMoves = [3,4];  
  board[8].downMoves = [4];  
  board[9].downMoves = [5];  
  board[10].downMoves = [5,6];
  board[11].downMoves = [6,7];  
  board[12].downMoves = [7,8];  
  for (var space = 13; space < 33; space++) {
    board[space].downMoves[0] = board[space-8].downMoves[0]+8;
    if (board[space-8].downMoves[1]>0) board[space].downMoves[1] = board[space-8].downMoves[1]+8;
  }
}

function Move(start, finish) {
  if (board[start].owner == " ") return "There is no checker on that space.";
  if (board[finish].owner != " ") return "The target space is occupied.";
  var validMove = false;
  if (board[start].owner = "X") {
    board[start].upMoves.forEach(function (space) {if (space == finish) validMove=true});
  }
  if (board[start].owner = "O") {
    board[start].downMoves.forEach(function (space) {if (space == finish) validMove=true});
  }
  if (!validMove) return "That checker cannot move there."
  board[finish].owner = board[start].owner;
  board[start].owner = " ";
  PrintBoard();
  return "Move completed"
}



//test code

InitializeBoard();
PrintBoard();
console.log(Move(21,13));



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