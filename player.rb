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
