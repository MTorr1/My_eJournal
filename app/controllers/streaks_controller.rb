class StreaksController < ApplicationController

    def show
        



    end

    def update
        streak = []
        if last_updated_date == Date.current
            streak +=1
        elsif last_updated_date != Date.yesterday
            streak = streak
        else last_update_date < Date.yesterday
            streak = 0
        end
    end

end


#  need to create an entry in my DB for streak 

