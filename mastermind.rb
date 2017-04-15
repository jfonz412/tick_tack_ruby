require './master_mod.rb'
include Mastermind

class Computer
  attr_reader :comp_guess

  def initialize(type)
  	@type = type
  	guess_or_check
  end

  private
  def guess_or_check
  	create_code if @type == :guess
  	guess_code if @type == :check 
  end

  def create_code
  	@code = []
    for n in 0..3
      @code[n] = 1 + rand(8)
    end
    #TESTING, DELETE BELOW
    @code = [8,4,2,1]
  end
  
  public
  def guess_code
    @comp_guess = []
    for n in 0..3
      @comp_guess[n] = 1 + rand(8)
    end
  end

  def check(guess_attempt)
  	guess = guess_attempt.split('').collect {|i| i.to_i}
  	temp_code = @code.dup

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

class Player
  attr_reader :guess, :type

  def initialize(name,type)
  	@name = name
  	@type = type
    guess_or_check
  end
   
  def guess_code
  	puts "Please enter 4 digits between 1-8"
    @guess = gets.chomp
    sanitize_guess
  end

  private

  def guess_or_check
    guess_code if @type == :guess 
    create_code if @type == :check
  end

  def create_code
  	puts "Create your code with 4 digits between 1-8"
    @code = gets.chomp
    sanitize_code
  end
  
  def sanitize_guess
  	guess_code if @guess.length != 4
  	invalid_count = 0
  	@guess.scan(/[^1-8]/){|i|invalid_count += 1}
  	guess_code if invalid_count != 0
  end

  def sanitize_code
    create_code if @code.length != 4
  	invalid_count = 0
  	@code.scan(/[^1-8]/){|i|invalid_count += 1}
  	create_code if invalid_count != 0
  end
end

# Initiate game
player_name = ask_name
player_choice = choose_game_type

computer = Computer.new(player_choice)
player = Player.new(player_name, player_choice)

# Play game

# player guesses computer's code
if player.type == :guess
  while computer.check(player.guess) == false
    player.guess_code
  end
else
  computer.guess_code
  puts computer.comp_guess  
end

# computer guesses player's code