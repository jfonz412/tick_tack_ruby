class Board
  attr_reader :grid

  def initialize
    @grid = {
 		A1: ' ',
 		B1: ' ',
 		C1: ' ',
 		A2: ' ',
 		B2: ' ',
 		C2: ' ',
 		A3: ' ',
 		B3: ' ',
 		C3: ' ',
 	}
 end

 public

 def draw_board(player_move = nil, player_piece = nil)
   update_grid(player_move,player_piece) if player_move != nil
   columns = 0 #tracks num of columns, not printed
   row = 2 #number for each row, printed ('1' is printed manually)
  	
   print "  A B C\n1"

   grid.each do |space,value|
   	print "|#{value}"
   	columns += 1
   	if columns == 3
   	  print "|\n#{row}" if row < 4
   	    row += 1
   	    columns = 0
   	  end
   	end
   	print "|\n"
 end

  private
  def update_grid(player_move, player_piece)
    grid[player_move] = player_piece
  end
end
