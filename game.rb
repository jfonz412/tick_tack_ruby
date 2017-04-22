require './initializer.rb'
require './player.rb'
require './board.rb'
require './checker.rb'

intro = Initializer.new
board = Board.new
checker = Check.new
player1 = Player.new(intro.p1_name, 'X')
player2 = Player.new(intro.p2_name, 'O')
board.draw_board

loop do
  # Player 1 goes
  player1.move(board.grid)
  board.draw_board(player1.current_move, player1.piece)
  break if checker.check_board(board.grid, player1.piece) == true

  if checker.turns == 9
  	puts "TIE GAME, PLAY AGAIN!!!"
  	break
  end

  # Player 2 goes
  player2.move(board.grid)
  board.draw_board(player2.current_move, player2.piece)
  break if checker.check_board(board.grid, player2.piece) == true
end

