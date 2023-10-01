# let's make a game 🎮

require_relative "lib/woopy/game"
require_relative "lib/woopy/player"
require_relative "lib/woopy/clumsy_player"
require_relative "lib/woopy/berserker_player"

# create and initialize game
game = Woopy::Game.new("Winner Takes All")
# .csv file containing the list of players + and their health
from_file = File.join(__dir__, "players.csv")
# load players from file
game.load_players(ARGV.shift || from_file)
# add both a clumsy and a berseker player to the game
clumsy = Woopy::ClumsyPlayer.new("klutz", 105)
berserker = Woopy::BerserkPlayer.new("berserker")
# add player to the game
game.add_player(clumsy)
game.add_player(berserker)

loop do
    print "\nHow many game rounds? ('quit' to exit) "
    answer = gets.chomp.downcase

    case answer
    when /^\d+$/
        #play the game
        game.play(answer.to_i)
    when "exit", "quit", "q"
        # print stats
        puts ""
        game.print_stat
        # save high scores to file if user desires
        loop do
            print "would you like to save the high scores result? [Y/n] "
            answer = gets.chomp.downcase

            case answer
            when "yes", "y"
                to_file = File.join(__dir__, "high_scores.csv")
                game.save_high_scores(to_file)
                puts "〽️ result saved to: #{to_file.split("/").last} 📃"
                break
            when "no", "n"
                break
            else
                puts "woopy: unknown option -- #{answer} 🙃"
            end
        end
        break
    else
        puts "Please enter a number 😾"
    end
end
