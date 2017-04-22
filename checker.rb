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