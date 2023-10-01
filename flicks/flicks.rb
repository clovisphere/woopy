# let's make our own IMDB 📺

require_relative "lib/flicks/movie"
require_relative "lib/flicks/movie3d"
require_relative "lib/flicks/playlist"

# create a new playlist
playlist = Playlist.new("Emilie")

# .csv file containing the list of movies + their ranking
from_file = File.join(__dir__, "movies.csv")
# load movies from file
playlist.load(ARGV.shift || from_file)

# initialize a 3D Movie 😎
m3d = Movie3D.new("godzilla", 0, 7)
# add it to the playlist
playlist.add_movie(m3d)

loop do
    print "how many viewings? ('quit' to exit) "
    answer = gets.chomp.downcase

    case answer
    when /^\d+$/
        playlist.play(answer.to_i)
    when "exit", "quit", "q"
        puts ""
        playlist.print_stat
        # save ranking result to file if user desires
        loop do
            print "would you like to save the ranking result? [Y/n] "
            answer = gets.chomp.downcase

            case answer
            when "yes", "y"
                to_file = File.join(__dir__, "movie_rankings.csv")
                playlist.save(to_file)
                puts "〽️ result saved to: #{to_file.split("/").last} 📃"
                break
            when "no", "n"
                break
            else
                puts "flicks: unknown option -- #{answer} 🙃"
                end
        end
        break
    else
        puts "please enter a number 🫢"
    end
end
