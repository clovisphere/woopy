require "minitest/autorun"
require_relative "../../lib/woopy/player"

module Woopy
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
            _(@player.health).must_equal 10
        end

        it "should have a string representation" do
            _(@player.to_s).must_equal "I'm Lionel with health = 10, points = 0 and score = 10"
        end

        it "should increase health by 15 when 'boost' is invoked" do
            @player.boost
            _(@player.health).must_equal 25
        end

        it "should decrease health by 10 when 'drain' is invoked" do
            @player.drain
            _(@player.health).must_equal 0
        end
    end
end
