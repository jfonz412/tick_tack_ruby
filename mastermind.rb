require './master_mod.rb'
include Mastermind
$right_answers = []

class Computer
  attr_reader :comp_guess

  def initialize(type)
  	@type = type
  	guess_or_check
  end

  #check method
  include Mastermind_obj

  def guess_code
    @comp_guess = [] 
    for n in 0..3
      @comp_guess[n] = 1 + rand(8)
    end
    @comp_guess = @comp_guess.join('') #so that it can be split again during check 
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
end

class Player
  attr_reader :guess, :type

  def initialize(name,type)
  	@name = name
  	@type = type
    guess_or_check
  end

  # check method
  include Mastermind_obj

  def guess_code
    loop do
  	  puts "Please enter 4 digits between 1-8"
      @guess = gets.chomp
      puts "\n"
      break if sanitize(@guess) == true
    end
  end

  private
  def guess_or_check
    guess_code if @type == :guess 
    create_code if @type == :check
  end

  def create_code
    loop do
  	  puts "Create your code with 4 digits between 1-8"
      @code = gets.chomp
      break if sanitize(@code) == true
    end
    @code = @code.split('').collect {|i| i.to_i}
  end
  
  def sanitize(input)
  	return false if input.length != 4
  	invalid_count = 0
  	input.scan(/[^1-8]/){|i|invalid_count += 1}
  	return false if invalid_count != 0
    true
  end
end

# Initiate game---------------------------------------------
player_name = ask_name
player_choice = choose_game_type

computer = Computer.new(player_choice)
player = Player.new(player_name, player_choice)

# Play game-------------------------------------------------
if player.type == :guess
  while computer.check(player.guess) != 0
    player.guess_code
  end
else
  computer.guess_code
  while player.check(computer.comp_guess) != 0
    computer.guess_code
    print $right_answers
  end
end
