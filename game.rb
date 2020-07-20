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
      validate(num_1, num_2, gets.chomp)
      puts "#{@p1.name} #{@p1.lives}/3 vs #{@p2.name} #{@p2.lives}/3"
      if (!has_player_died?)
        change_player
        puts "----- NEW TURN -----"
      else 
        puts "#{winner.name} wins with a score of #{winner.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      end
    end
  end

  def get_player_names
    puts "Enter name for first player"
    print "> "
    @p1.name = gets.chomp
    puts"Enter name for second player"
    print "> "
    @p2.name = gets.chomp
  end

  def has_player_died?
    @p1.lives <= 0 || @p2.lives <= 0
  end

  def winner
    if @p1.lives <= 0
      return @p2
    else
      return @p1
    end
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

