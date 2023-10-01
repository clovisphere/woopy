require_relative "movie"

class Movie3D < Movie

    def initialize(title, rank, wow_factor)
        super(title, rank)
        @wow_factor = wow_factor
    end

    def show_effect
        "wow" * @wow_factor
    end

    def thumbs_up = @wow_factor.times { super }
end

if __FILE__ == $0
    puts ""
    puts "".center(63, "-*-")
    puts "class' superclass: #{Movie3D.superclass}"
    puts "class' ancestors: #{Movie3D.ancestors}"
    puts "".center(63, "-*-")
    puts ""

    m3d = Movie3D.new("godzilla", 1, 3)
    puts "👍 -> #{m3d.thumbs_up}"
    puts "📽️  -> #{m3d}"
end
