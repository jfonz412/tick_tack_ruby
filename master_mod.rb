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

module Mastermind_obj

  def check(guess_attempt)
    guess = guess_attempt.split('').collect {|i| i.to_i}
    print guess
    temp_code = @code.dup
    print temp_code
    if guess == temp_code 
      puts("YOU WIN!!!")
      return true
    else
      correct_place_count = 0
      correct_num_count = 0
      # CHECK FOR CORRECT NUMBER WITH CORRECT PLACEMENT
      for n in 0..3
        if guess[n] == temp_code[n]
          correct_place_count += 1
          guess[n] = nil
          temp_code[n] = nil
        end
      end
      # CHECK FOR CORRECT NUMBERS IN THE WRONG PLACE
      for i in 0..3
        for k in 0..3
          if temp_code[i] == guess[k] && guess[k] != nil
            correct_num_count += 1
            temp_code[i] = nil
          end
        end
      end

    end
    puts "Sorry, but you guessed #{correct_place_count} numbers completely correct and #{correct_num_count} correct but in the wrong place."
    false
  end

end