require "minitest/autorun"
require_relative "../../lib/flicks/movie"

class MovieTest < Minitest::Test

    def setup
        @movie = Movie.new("toy story", 7)
    end

    def test_has_a_capitalize_title
        assert_equal "Toy Story", @movie.title
    end

    def test_has_an_initial_rank
        assert_equal 7, @movie.rank
    end

    def test_has_a_string_representation
        assert_equal "Toy Story       ⭐️⭐️⭐️⭐️⭐️⭐️⭐️       7/10", @movie.to_s
    end

    def test_thumbs_up_increases_rank_by_1
        @movie.thumbs_up
        assert_equal 8, @movie.rank
    end

    def test_thumbs_down_decreases_rank_by_1
        @movie.thumbs_down
        assert_equal 6, @movie.rank
    end

end
