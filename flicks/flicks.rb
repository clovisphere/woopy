# let's make our own IMDB 📺

require_relative "lib/flicks/movie"
require_relative "lib/flicks/playlist"

playlist = Playlist.new("Emilie")

playlist.add_movie(Movie.new("Pretty Woman", 6))
playlist.add_movie(Movie.new("Gladiator", 2))
playlist.add_movie(Movie.new("Ghost", 3))

loop do
    print "How many viewings? ('quit' to exit) "
    answer = gets.chomp.downcase

    case answer
    when /^\d+$/
        playlist.play(answer.to_i)
    when "exit", "quit", "q"
        playlist.print_stat
        break
    else
        puts "Please enter a number 🫢"
    end
end
