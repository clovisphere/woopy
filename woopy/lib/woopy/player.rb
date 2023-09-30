class Player
    attr_reader :name, :health, :found_treasures

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

    def boost = @health += 15

    def drain = @health -= 10

    def score = @health + points

    def to_s = "I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}"

    private

    def points = @found_treasures.values.sum

end
