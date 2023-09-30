class Playlist

    attr_reader :name, :movies

    def initialize(name)
        @name = name.capitalize
        @movies = []
    end

    def add_movie(movie)
        @movies << movie
    end

    def play
        @movies.each do |movie|
            number_rolled = roll_die
            case number_rolled
            when 1..2
                movie.thumbs_down
            when 5..6
                movie.thumbs_up
            end
        end

        puts "".center(43, "-")
        puts " #{@name}'s playlist 📺 ".center(42, ".\\^@>*:=<*")
        puts "".center(43, "-")
        puts @movies
    end

    private

    def roll_die = rand(1..6)

end
