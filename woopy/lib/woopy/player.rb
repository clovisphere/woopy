class Player
    attr_reader :name, :health

    def initialize(name, health = 100)
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

    def to_s = "I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}"

    private

    def score = points + @health

    def points = @found_treasures.values.sum

end
