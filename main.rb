require "./game.rb"
require "./player.rb"

player_1 = Player.new("Erica")
player_2 = Player.new("Lynn")

game = Game.new(player_1, player_2)

while !game.has_player_died? && game.next
  game.next = false
  num_1 = rand(21)
  num_2 = rand(21)
  puts game.question(num_1, num_2)
  puts "> "
  # game.validate(num_1, num_2, gets.chomp)
end


