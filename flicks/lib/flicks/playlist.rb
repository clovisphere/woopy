require_relative "snackbar"

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
        puts "\nThe snackbar has:"
        Snackbar::SNACKS.each { |snack| puts "- #{snack.name.capitalize} for $#{'%.2f' % snack.price}" }

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

                snack = Snackbar.random_snack
                movie.add_snack(snack.name, snack.price)
                puts "During '#{movie.title}' 🎞️ , #{@name} ate #{snack.name} for $#{snack.price}\n\n"
            end
        end

        puts ""
        puts "".center(43, "-")
        puts " #{@name}'s playlist 📺 ".center(42, ".\\^@>*:=<*")
        puts "".center(43, "-")
        puts @movies
    end

    private

    def roll_die = rand(1..6)

end
