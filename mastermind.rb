class Computer
  def initialize(type)
  	@type = type
  	guess_or_check
  end

  private
  def guess_or_check
  	create_code if @type == :check
  end

  def create_code
  	@code = []
    for n in 0..3
      @code[n] = 1 + rand(8)
    end
  end

  public
  def check(guess_attempt)
  	guess = guess_attempt.split('')
  	#WORKING ON THE CHECKING HERE!!!
  end

end

class Player
  attr_reader :guess
  def initialize(name,type)
  	@name = name
  	@type = type
  	
  end
 
  def guess_or_check
  	guess_code if @type == :guess
  end
  
  private
  def guess_code
  	puts "Please enter 4 digits between 1-8"
    @guess = gets.chomp
    sanitize_code
  end
  
  def sanitize_code
  	guess_code if @guess.length > 4

  	invalid_count = 0
  	@guess.scan(/[^1-8]/){|i|invalid_count += 1}
  	guess_code if invalid_count != 0
  end
end

# Initiate game
computer = Computer.new(:check)
player = Player.new("Jimbo", :guess)

# Play game
player.guess_or_check
computer.check(player.guess)
