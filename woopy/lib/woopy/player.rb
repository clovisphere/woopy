require_relative "playable"

module Woopy
    class Player
        include Playable

        attr_reader :name, :found_treasures
        attr_accessor :health

        def initialize(name, health = 10)
            @name = name.capitalize
            @health = health
            @found_treasures = Hash.new(0)
        end


        def add_treasure(name, points)
            @found_treasures[name] += points
        end

        def name=(new_name)
            @name = new_name.capitalize
        end

        def score = @health + points

        def self.from_csv(row)
            Player.new(row[0], Integer(row[1]))
        rescue ArgumentError
            puts "woopy: invalid value -- #{row[1]}"
            Player.new(row[0])
        end

        def to_s = "I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}"

        def points = @found_treasures.values.sum

    end
end
