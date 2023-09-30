class Game

    # define a struct
    Treasure = Struct.new(:name, :points)

    # 👉🏽 use a Data class (https://docs.ruby-lang.org/en/3.2/Data.html) instead (ruby >= 3.2)
    #Treasure = Data.define(:name, :price)

    TREASURES = [
        Treasure.new("🥧", 10),
        Treasure.new("🪙", 25),
        Treasure.new("🪈", 50),
        Treasure.new("🧭", 65),
        Treasure.new("🔑", 80),
        Treasure.new("👑", 90),
        Treasure.new("⭐️", 100)
    ]

    attr_reader :title, :players

    def initialize(title)
        @title = title
        @players = []
    end

    def add_player(player) = @players << player

    def play(rounds = 1)
        puts "\nThe following treasures can be found:"
        TREASURES.each { |treasure| puts "- #{treasure.name} is worth #{treasure.points} points" }

        puts "\nBefore playing:"
        puts @players

        1.upto(rounds) do |round|
            puts "\n[Round 🕹️  ##{round}]:"
            @players.each do |player|
                number_rolled = roll_die
                case number_rolled
                when 1..2
                    player.drain
                    puts "#{player.name} got drained 😿"
                when 3..4
                    puts "#{player.name} got skipped 😾"
                else
                    player.boost
                    puts "#{player.name} got boosted 😺"
                end
                treasure = TREASURES.sample
                puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points\n\n"
            end
        end

        puts "\nAfter playing:"
        puts @players
    end

    private
    def roll_die = rand(1..6)
end
