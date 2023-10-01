module Flicks
    module Snackbar

        # define a struct
        Snack = Struct.new(:name, :price)

        # 👉🏽 use a Data class (https://docs.ruby-lang.org/en/3.2/Data.html) instead (ruby >= 3.2)
        #Snack = Data.define(:name, :price)

        SNACKS = [
            Snack.new("🍪", 2),
            Snack.new("🍫", 5),
            Snack.new("🌮", 6),
            Snack.new("🍦", 3)
        ]

        def self.random_snack = SNACKS.sample

        def self.menu_items
            SNACKS.map { |snack| "- #{snack.name} for $#{'%.2f' % snack.price}" }
        end

    end
end
