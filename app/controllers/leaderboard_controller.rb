class LeaderboardController < ApplicationController
    def show
        @board = Board.find(params[:id])

        render json: @board
    end
end
