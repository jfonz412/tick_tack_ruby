module Mastermind
  def choose_game_type  
    puts "Enter '1' to guess the computer code \nEnter '2' to create your own code."
    player_choice = gets.chomp.to_i
    if player_choice == 1
      :guess
    elsif player_choice == 2
      :check
    else
      puts "\nInvalid entry..."
  	  choose_game_type
    end
  end

  def ask_name
    puts "Please enter your name:"
    player_name = gets.chomp
    puts "\n"
    puts "Hello, #{player_name}, would you like to guess the computer's code or create your own?\n\n"
  end
end