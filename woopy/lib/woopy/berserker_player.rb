require_relative "player"

module Woopy
    class BerserkPlayer < Player
        def initialize(name, health = 50)
            super(name, health)
            @boost_count = 0
        end

        def berserk? = @boost_count > 5

        def boost
            super
            @boost_count += 1
            puts "#{@name} is berserk!" if berserk?
        end

        def drain
            berserk? ? boost  : super
        end
    end
end

if __FILE__ == $0
    berserker = Woopy::BerserkPlayer.new("berserker")
    6.times { berserker.boost }
    2.times { berserker.drain }
    puts berserker.health
end
