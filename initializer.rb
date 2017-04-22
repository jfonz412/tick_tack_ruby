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