require "csv"
require_relative "treasure_trove"
require_relative "auditable"

module Woopy
    class Game
        include Auditable

        attr_reader :title, :players

        def initialize(title)
            @title = title.split.map(&:capitalize)*' '
            @players = []
        end

        def load_players(from_file)
            CSV.foreach(from_file) do |row|
                player = Player.from_csv(row)
                add_player(player)
            end
        rescue Errno::ENOENT
            puts "woopy: #{from_file} 📃 not found!"
            exit 1
        end

        def save_high_scores(to_file)
            File.open(to_file, "w") do |file|
                file.puts "".center(60, "=")
                file.puts " #{@title}'s High Scores ".center(60)
                file.puts "".center(60, "=")
                sorted_players.each { |player| file.puts high_score_entry(player) }
            end
        end

        def add_player(player) = @players << player

        def play(rounds = 1)
            puts "".center(60, "-")
            puts " #{@title} 🕹️  ".center(60)
            puts "".center(60, "-")

            puts "\nThe following treasures can be found:"
            puts TreasureTrove.treasure_items
            puts ""

            1.upto(rounds) do |round|
                puts "\n[Round ##{round}]:"
                @players.each do |player|
                    number_rolled = roll_die
                    case number_rolled
                    when 1..2
                        player.drain
                        puts "#{player.name} got drained 😾"
                    when 3..4
                        puts "#{player.name} got skipped 😿"
                    else
                        player.boost
                        puts "#{player.name} got boosted 😽"
                    end

                    unless number_rolled in 3..4  # players who are skipped shouldn't obtain a treasure
                        treasure = TreasureTrove.random_treasure
                        player.add_treasure(treasure.name, treasure.points)
                    end
                end
            end
        end

        def print_stat
            sorted_players.each do |player|
                unless player.found_treasures.empty?
                    puts "#{player.name}'s treasure point total: "
                    total = 0
                    player.found_treasures.each do |name, points|
                        total += points
                        name = "#{name} ~>".ljust(6)
                        puts "#{name} #{points.to_s.ljust(4)}"
                    end

                    if total > 0
                        puts "".center(10, "-")
                        puts "Total: #{total.to_s.ljust(5)}"
                        puts ""
                    end
                end
            end

            puts "".center(20, "=")
            puts "High Scores"
            puts "".center(20, "=")
            sorted_players.each { |player| puts high_score_entry(player) }
            puts ""
        end

        private

        def roll_die
            number = rand(1..6)  # ~> cheat with a " loaded die": [1, 1, 2, 5, 6, 6].sample
            audit(number)
            number
        end

        def sorted_players = @players.sort_by { |player| player.score }.reverse

        def high_score_entry(player) = "#{player.name.ljust(15, ".")} #{player.score}"
    end
end
