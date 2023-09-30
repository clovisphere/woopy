class Movie

    attr_reader :title, :rank, :snacks_eaten

    def initialize(title, rank = 0)
        @title = title.split.map(&:capitalize)*' '  # capitalize all words in a string
        @rank = rank
        @snacks_eaten = Hash.new(0)
    end

    def add_snack(name, price)
        @snacks_eaten[name] += price
    end

    def thumbs_up = (@rank +=1 if @rank < 10)

    def thumbs_down = (@rank -=1 if @rank > 0)

    def to_s
        pp_rank = "#{@rank}/10".rjust(3)  # pretty print rank 😽
        "#{@title.ljust(15)} #{emoji(score: @rank, emoji: "⭐️").ljust(20)} #{pp_rank}"
    end

    private

    def emoji(score:, emoji: "😺") = score > 0 ? emoji * score : ""

end


if __FILE__ == $0
    movie = Movie.new("star wars", 8)
    puts movie
end
