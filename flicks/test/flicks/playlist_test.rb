require "minitest/autorun"
require_relative "../../lib/flicks/movie"
require_relative "../../lib/flicks/playlist"

class PlaylistTest < Minitest::Test

    def setup
        @playlist = Playlist.new("What the heck?")
        # create movies
        @m1 = Movie.new("Les Gendarmes de St. Tropez", 7)
        @m2 = Movie.new("Mobutu Roi du Zaire", 2)

        # suppress STDOUT in tests
        $stdout = StringIO.new
    end

    def  test_has_no_movies_initially?
        assert_empty @playlist.movies
    end

    def test_add_movies
        # add movies to the playlist
        @playlist.add_movie(@m1)
        @playlist.add_movie(@m2)

        refute_empty @playlist.movies
        assert_equal [@m1, @m2], @playlist.movies
    end

    def test_high_number_rolled_gives_movie_a_thumbs_up
        @playlist.add_movie(@m1)

        @playlist.stub(:roll_die, 6) do
            @playlist.play

            assert_equal 8, @m1.rank
        end
    end

    def test_low_number_rolled_gives_movie_a_thumbs_down
        @playlist.add_movie(@m1)

        @playlist.stub(:roll_die, 1) do
            @playlist.play

            assert_equal 6, @m1.rank
        end
    end

end
