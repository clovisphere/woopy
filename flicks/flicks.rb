# let's make our own IMDB 📺

require_relative "lib/flicks/movie"
require_relative "lib/flicks/playlist"

playlist = Playlist.new("Emilie")

playlist.add_movie(Movie.new("Pretty Woman", 6))
playlist.add_movie(Movie.new("Gladiator", 2))
playlist.add_movie(Movie.new("Ghost", 3))

playlist.play(1)
playlist.print_stat
