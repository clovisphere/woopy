require "minitest/autorun"
require_relative "../../lib/woopy/player"

describe Player do

    before do
         @player = Player.new("lionel")
    end

    it "should return a capitalized name" do
        _(@player.name).must_equal "Lionel"
    end

    it "should allow a player's name to be changed" do
        @player.name = "messi"
        _(@player.name).must_equal "Messi"
    end

    it "should have a default health" do
        _(@player.health).must_equal 100
    end

    it "should have a string representation" do
        _(@player.to_s).must_equal "I'm Lionel with a health of 100 and a score of 106"
    end

    it "should increase health by 15 when 'boost' is invoked" do
        @player.boost
        _(@player.health).must_equal 115
    end

    it "should decrease health by 10 when 'drain' is invoked" do
        @player.drain
        _(@player.health).must_equal 90
    end

end
