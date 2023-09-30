class Player
    attr_reader :name, :health

    def initialize(name, health = 100)
        @name = name.capitalize
        @health = health
    end

    def name=(new_name)
        @name = new_name.capitalize
    end

    def boost = @health += 15

    def drain = @health -= 10

    def to_s = "I'm #{@name} with a health of #{@health} and a score of #{score}"

    private

    def score = @name.length + @health

end
