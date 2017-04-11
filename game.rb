#CLASS DEFINITIONS------------------------------------
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
  
  def draw_grid
  	counter = 0
  	row = 2
  	print "  A B C\n1"

    @grid.each do |space,value|
   	  print "|#{value}"
   	  counter += 1
   	  if counter == 3
   	  	print "|\n#{row}" if row < 4
   	  	row += 1
   	  	counter = 0
   	  end
   	end

   	print "|\n"
  end

  def update(location,piece_type)
    @grid[location] = piece_type 
  end

  def check_win(piece)
  	checks = 0
    wins = [[:A1,:A2,:A3],[:B1,:B2,:B3],[:C1,:C2,:C3],[:A1,:B1,:C1],[:A2,:B2,:C2],[:A3,:B3,:C3],[:A1,:B2,:C3],[:C1,:B2,:A3]]
    wins.each do |i|
      i.each do |slot|
        checks += 1 if @grid[slot] == piece
      end
      if checks == 3
      	return true
      else
      	checks = 0
      end
    end
    false
  end

end


class Player
  attr_reader :piece_type, :name

  def initialize(name, piece_type)
    @name = name
    @piece_type = piece_type
  end
  
  def move(board_state,location)
    #check board
    location = location.to_sym
    if board_state[location] != " "
      puts "Please pick a valid space"
    else
      location
    end
  end
end
#END CLASS DEFINITIONS--------------------------

#PLAY METHOD
def play(player, board)
  puts "#{player.name}, make your move:"
  move_location = nil
  while move_location == nil
    location = gets.chomp.upcase
    move_location = player.move(board.grid, location)
  end
  board.update(move_location, player.piece_type)
  board.draw_grid
end


#INITIALIZE BOARD AND PLAYERS

board = Board.new
board.draw_grid

player1 = Player.new("Jimmy", 'X')
player2 = Player.new("Shannon", 'O')

#BEGIN PLAYING
while true
  play(player1, board)
  if board.check_win(player1.piece_type) == true
  	puts "#{player1.name} wins!!!"
  	break
  end
  play(player2,board)
  if board.check_win(player2.piece_type) == true
  	puts "#{player2.name} wins!!!"
  	break
  end
end