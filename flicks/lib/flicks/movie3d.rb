require_relative "movie"

module Flicks
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
end

if __FILE__ == $0
    puts ""
    puts "".center(100, "-*-")
    puts "class' superclass: #{Flicks::Movie3D.superclass}"
    puts "class' ancestors: #{Flicks::Movie3D.ancestors}"
    puts "".center(100, "-*-")

    m3d = Flicks::Movie3D.new("godzilla", 1, 3)
    puts "👍 -> #{m3d.thumbs_up}"
    puts "📽️  -> #{m3d}"
end
