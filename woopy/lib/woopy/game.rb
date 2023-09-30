require_relative "treasure_trove"

class Game

    attr_reader :title, :players

    def initialize(title)
        @title = title
        @players = []
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
                when 5..6
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
        # puts ""
        # puts sorted_players
        # puts ""
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
        sorted_players.each { |player| puts "#{player.name.ljust(15, ".")} #{player.score}" }
        puts ""
    end

    private

    def roll_die = rand(1..6)

    def sorted_players = @players.sort_by { |player| player.score }.reverse
end
