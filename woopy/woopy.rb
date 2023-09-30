# let's make a game 🎮

require_relative "lib/woopy/game"
require_relative "lib/woopy/player"

# create players
p1 = Player.new("Hailey", 110)
p2 = Player.new("Rihanna", 145)
p3 = Player.new("Emilie")
# create and initialize game
chipmunks = Game.new("Winner Takes All")
# add players to game
chipmunks.add_player(p1)
chipmunks.add_player(p2)
chipmunks.add_player(p3)
#play the game
chipmunks.play(2)
# print stats
chipmunks.print_stat
