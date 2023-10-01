require_relative "movie"
require_relative "snackbar"

module Flicks
    class Playlist

        attr_reader :name, :movies

        def initialize(name)
            @name = name.capitalize
            @movies = []
        end

        def load(from_file)
            File.readlines(from_file, chomp: true).each do |line|
                movie = Movie.from_csv(line)
                add_movie(movie)
            end
        rescue Errno::ENOENT
            puts "flicks: #{from_file} 📃 not found!"
            exit 1
        end

        def save(to_file)
            File.open(to_file, "w") do |file|
                sorted_movies.each do |movie|
                    file.puts movie.to_csv
                end
            end
        end

        def add_movie(movie)
            @movies << movie
        end

        def print_stat
            puts "".center(43, "-")
            puts " #{@name}'s 📽️  ranking".center(42, ".\\^@>*:=<*")
            puts "".center(43, "-")
            puts sorted_movies

            total_per_item = Hash.new(Hash.new(0))
            @movies.each do |movie, index|
                movie.snacks_eaten.each do |name, price|
                    qty = total_per_item[name][:quantity] + 1
                    pce = total_per_item[name][:price] + price
                    total_per_item[name] = { quantity: qty, price: pce }
                end
            end

            unless total_per_item.empty?
                puts ""
                puts "".center(32, "=")
                puts "💫 Hailey's kitchen 🌭 🍟".center(32)
                puts "".center(32, "=")

                total = 0
                total_per_item.each.with_index(1) do |(key, item), index|
                    total += item[:price]
                    pp_price = "%.2f" % item[:price]  # pretty print price
                    pp_items = "(#{item[:quantity]}x) #{key}".ljust(20, ".")
                    puts "#{index}. #{pp_items} $ #{pp_price.rjust(5)}️"
                end

                total = "%.2f" % total
                puts "".ljust(32, "-")
                puts "#{"Total".ljust(24)} $ #{total.rjust(5)} ✅"
            end
        end

        def play(viewings = 3)
            puts "\nThe snackbar has:"
            puts Snackbar.menu_items

            1.upto(viewings) do |viewing_number|
                 puts "\n[Viewing 📽 ️ ##{viewing_number}]:"
                @movies.each do |movie|
                    number_rolled = roll_die
                    case number_rolled
                    when 1..2
                        movie.thumbs_down
                        puts "#{movie.title} got a 👎"
                    when 3..4
                        puts "#{movie.title} got skipped 😢\n\n"  # no snack 🫢
                    else
                        movie.thumbs_up
                        puts "#{movie.title} got a 👍"
                    end

                    unless number_rolled in 3..4  # should only eat snack when viewing "movies":-)
                        snack = Snackbar.random_snack
                        movie.add_snack(snack.name, snack.price)
                        puts "(During '#{movie.title}' viewing 🎞️ , #{@name} ate #{snack.name} for $#{snack.price})\n\n"
                    end
                end
            end
        end

        private

        def roll_die = rand(1..6)

        def sorted_movies = @movies.sort_by { |movie| movie.rank }
    end
end
