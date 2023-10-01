require_relative "player"

class ClumsyPlayer < Player
    def initialize(name, health = 100, boost_factor = 1)
        super(name, health)
        @boost_factor = boost_factor
    end

    def add_treasure(name, points)
        points = points / 2.0
        super(name, points.to_i)
    end

    def boost
      @boost_factor.times { super }
    end
end

if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz", 105)

  clumsy.add_treasure("🪈", 50)
  clumsy.add_treasure("🪈", 50)
  clumsy.add_treasure("🪈", 50)
  clumsy.add_treasure("⭐️", 100)

  puts ""
  total = 0
  clumsy.found_treasures.each do |name, points|
      total += points
      name = "#{name} ~>".ljust(4)
      puts "#{name} #{points.to_i.to_s.rjust(4)}"
  end

  if total > 0
      puts "".center(12, "-")
      puts "Total: #{total.to_i.to_s.rjust(3)} (points)"
      puts ""
  end
end
