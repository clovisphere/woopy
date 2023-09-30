module TreasureTrove
    # define a struct
    Treasure = Struct.new(:name, :points)

    # 👉🏽 use a Data class (https://docs.ruby-lang.org/en/3.2/Data.html) instead (ruby >= 3.2)
    #Treasure = Data.define(:name, :points)

    TREASURES = [
        Treasure.new("🥧", 10),
        Treasure.new("🪙", 25),
        Treasure.new("🪈", 50),
        Treasure.new("🧭", 65),
        Treasure.new("🔑", 80),
        Treasure.new("👑", 90),
        Treasure.new("⭐️", 100)
    ]

    def self.random_treasure = TREASURES.sample

    def self.treasure_items = TREASURES.map { |treasure| "- #{treasure.name} is worth #{treasure.points} points" }
end
