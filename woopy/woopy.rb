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

loop do
    print "\nHow many game rounds? ('quit' to exit) "
    answer = gets.chomp.downcase

    case answer
    when /^\d+$/
        #play the game
        chipmunks.play(answer.to_i)
    when "exit", "quit", "q"
        # print stats
        puts ""
        chipmunks.print_stat
        break
    else
        puts "Please enter a number 😾"
    end
end
