class Playlist

    attr_reader :name, :movies

    def initialize(name)
        @name = name.capitalize
        @movies = []
    end

    def add_movie(movie)
        @movies << movie
    end

    def play(viewings = 3)
        1.upto(viewings) do | viewing_number |
             puts "\n[Viewing 📽 ️ ##{viewing_number}]:"
            @movies.each do |movie|
                number_rolled = roll_die
                case number_rolled
                when 1..2
                    movie.thumbs_down
                    puts "#{movie.title} got a 👎"
                when 3..4
                    puts "#{movie.title} got skipped"
                else
                    movie.thumbs_up
                    puts "#{movie.title} got a 👍"
                end
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
