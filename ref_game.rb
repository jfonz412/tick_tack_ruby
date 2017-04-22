class Initializer
  attr_reader :p1_name, :p2_name

  def initialize
    gather_player_info
  end

  private
  def gather_player_info
    puts "-----Welcome to Tick Tack Toe!-----"

    puts "Player 1, please enter your name:"
    @p1_name = gets.chomp

    puts "Player 2, please enter your name:"
    @p2_name = gets.chomp

    puts "Player 1 you have X's, player 2 has O's"
    puts "Player 1 goes first!"
  end
end

class Player
  attr_reader :name, :piece, :current_move
  def initialize(name,piece)
  	@name = name
  	@piece = piece
  end

  public
  def move(grid)
  	loop do
      puts "#{name}, please make your move."
      @current_move = gets.chomp.upcase.to_sym
      break if validate_move(grid,current_move) == true
    end
  end

  private
  def validate_move(grid,move_attempt)
  	if grid[move_attempt] != " "
  	  puts "Invalid move, try again."
  	  false
  	else
  	  true
  	end
  end
end


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


class Check
  attr_reader :turns

  def initialize
    @turns = 0
    @wins = [
      [:A1,:A2,:A3],[:B1,:B2,:B3],[:C1,:C2,:C3],[:A1,:B1,:C1],
      [:A2,:B2,:C2],[:A3,:B3,:C3],[:A1,:B2,:C3],[:C1,:B2,:A3]
    ]
  end

  def check_board(grid, player_piece)
    checks = 0

    @wins.each do |i|
      i.each do |slot|
      	checks += 1 if grid[slot] == player_piece
      end
      if checks == 3 
      	puts "YOU WIN!!!"
        return true 
      else
        checks = 0
      end
    end
    @turns += 1
    false
  end

end

intro = Initializer.new
board = Board.new
checker = Check.new
player1 = Player.new(intro.p1_name, 'X')
player2 = Player.new(intro.p2_name, 'O')
board.draw_board

loop do
  player1.move(board.grid)
  board.draw_board(player1.current_move, player1.piece)
  break if checker.check_board(board.grid, player1.piece) == true
  break if checker.turns == 9
  # Player 2 goes
  player2.move(board.grid)
  board.draw_board(player2.current_move, player2.piece)
  break if checker.check_board(board.grid, player2.piece) == true
end
# always prints, make conditional.
puts "TIE GAME, PLAY AGAIN!!!"