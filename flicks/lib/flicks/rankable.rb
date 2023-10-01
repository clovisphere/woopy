module Flicks
    module Rankable

        def thumbs_up
            self.rank +=1 if self.rank < 10
        end

        def thumbs_down
            self.rank -=1 if self.rank > 0
        end
    end
end
