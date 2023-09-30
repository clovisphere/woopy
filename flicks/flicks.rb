# let's make our own IMDB 📺

require_relative "lib/flicks/movie"
require_relative "lib/flicks/playlist"

playlist = Playlist.new("Emilie")

playlist.add_movie(Movie.new("Pretty Woman", 7))
playlist.add_movie(Movie.new("Jurrasic Park", 5))
playlist.add_movie(Movie.new("Rambo 3", 3))

playlist.play
