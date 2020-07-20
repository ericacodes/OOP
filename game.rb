class Game
  attr_accessor :next

  def initialize(player_1, player_2)
    @p1 = player_1
    @p2 = player_2
    @current_player = @p1
    @next = true
  end

  def has_player_died?
    @p1.lives <= 0 || @p2.lives <= 0
  end

  def question(num_1, num_2)
    "#{@current_player.name}: What does #{num_1} plus #{num_2} equal?"
  end

  def validate(num_1, num_2, answer)
  end


end