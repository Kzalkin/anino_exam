class Admin::LeaderboardController < ApplicationController
    def create
        @leaderboard = Leaderboard.new(leaderboard_params)

        if @leaderboard.save
            render json: @leaderboard
        else
            render json: {status: "Error", errors: @leaderboard.errors}
        end
    end

    private

    def leaderboard_params
        params.permit(:name)
    end
end
