require_relative "rankable"

module Flicks
    class Movie
        include Rankable

        attr_reader :snacks_eaten
        attr_accessor :title, :rank

        def initialize(title, rank = 0)
            @title = title.split.map(&:capitalize)*' '  # capitalize all words in a string
            @rank = rank
            @snacks_eaten = Hash.new(0)
        end

        def add_snack(name, price)
            @snacks_eaten[name] += price
        end

        def self.from_csv(line)
            title, rank = line.split(",")
            Movie.new(title, Integer(rank))
        rescue ArgumentError
            puts "flicks: invalid value -- #{rank}"
            Movie.new(title)
        end

        def to_csv = "#{@title},#{@rank}"

        def to_s
            pp_rank = "#{@rank}/10".rjust(3)  # pretty print rank 😽
            "#{@title.ljust(15)} #{emoji(score: @rank, emoji: "⭐️").ljust(20)} #{pp_rank}"
        end

        private

        def emoji(score:, emoji: "😺") = score > 0 ? emoji * score : ""
    end
end

if __FILE__ == $0
    movie = Flicks::Movie.new("star wars", 8)
    puts movie
end
