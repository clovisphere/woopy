require "minitest/autorun"
require_relative "../../lib/woopy/player"
require_relative "../../lib/woopy/game"

describe Game do

    before do
        @game = Game.new("New World Order")
        # create players
        @p1 = Player.new("Donald")
        @p2 = Player.new("Bucky", 120)
        # suppress STDOUT in tests
        $stdout = StringIO.new
    end

    it  "should have no player initialized" do
        _(@game.players).must_be_empty
    end

    it "should be able to add (new) player" do
        # add movies to the playlist
        @game.add_player(@p1)
        @game.add_player(@p2)

        _(@game.players).wont_be_empty
        _(@game.players).must_equal [@p1, @p2]
    end

    it "should boost player's health when high number is rolled" do
        @game.add_player(@p1)

        @game.stub(:roll_die, 6) do
            @game.play

            _(@p1.health).must_equal 115
        end
    end

    it "should drain player's health when low number is rolled" do
        @game.add_player(@p1)

        @game.stub(:roll_die, 1) do
            @game.play

            _(@p1.health).must_equal 90
        end
    end

end
