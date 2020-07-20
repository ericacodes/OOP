require "./player.rb"

class Game
  attr_accessor :current_player

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @current_player = @p1
  end

  def game_loop
    get_player_names
    while !has_player_died?
      num_1 = rand(21)
      num_2 = rand(21)
      puts question(num_1, num_2)
      print "> "
      # answer = gets.chomp
      validate(num_1, num_2, gets.chomp)
      puts "#{@p1.name} #{@p1.lives}/3 vs #{@p2.name} #{@p2.lives}/3"
      puts "----- NEW TURN -----"
      change_player
    end
  end

  def get_player_names
    puts "Enter name for first player"
    print "> "
    p1_name = gets.chomp
    @p1.name = p1_name
    puts"Enter name for second player"
    print "> "
    p2_name = gets.chomp
    @p2.name = p2_name
  end

  def has_player_died?
    @p1.lives <= 0 || @p2.lives <= 0
  end

  def question(num_1, num_2)
    "#{@current_player.name}: What does #{num_1} plus #{num_2} equal?"
  end

  def validate(num_1, num_2, answer)
    correct_answer = num_1 + num_2
    if answer.to_i == correct_answer
      return "YES! You are correct."
    else
      current_player.lose_life
      return "Seriously? No! #{num_1 + num_2} #{correct_answer}"
    end
  end

  def change_player
    if @current_player == @p1
      @current_player = @p2
    else
      @current_player = @p1
    end
  end


end

