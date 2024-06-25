class Game 
  attr_accessor :current_player, :p_one_score, :p_two_score, :num_one, :num_two
  attr_reader :player_one, :player_two

  def initialize
    @player_one = "Player 1"
    @player_two = "Player 2"
    @current_player = nil 
    @p_one_score = 3
    @p_two_score = 3
    @num_one = nil
    @num_two = nil
    generate_new_numbers
  end

  def players
    [@player_one, @player_two]
  end

  def change_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def generate_new_numbers
    @num_one = rand(10)
    @num_two = rand(10)
  end

  def keep_score
    if @current_player == @player_one
      @p_two_score -= 1
    else
      @p_one_score -= 1
    end
  end

  def ask_question
    generate_new_numbers
    puts "#{@current_player}: What is #{@num_one} + #{@num_two}? "
    player_answer = gets.chomp.to_i
    check_answer(player_answer)
  end

  def check_answer(player_answer)
    right_answer = @num_one + @num_two
    if player_answer == right_answer
      puts "#{@current_player}: You're right!"
      puts "P1: #{@p_one_score}/3 VS P2: #{@p_two_score}/3"
    else 
      puts "#{@current_player}: You're wrong!"
      keep_score
      puts "P1: #{@p_one_score}/3 VS P2: #{@p_two_score}/3"
    end
  end

  def start_game
    @current_player = players[rand(0..1)]
  end

  def end_game
    if @p_one_score > @p_two_score
      puts "Player 1 wins! Too bad Player 2"
    else
      puts "Player 2 wins! Too bad Player 1"
    end
  end

  def run_game     
    start_game
    while @p_one_score > 0 && @p_two_score >0
      ask_question
      change_player
    end
    end_game
  end
end

start_new_game = Game.new 
start_new_game.run_game