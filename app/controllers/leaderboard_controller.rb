class LeaderboardController < ApplicationController
    def show
        @board = Board.find(params[:id])

        render json: @board, flag: "rank"
    end

    def add_score
        @board = Board.find(params[:leaderboard_id])
        @entry = @board.entries.find_by(user_id: params[:user_id])
        @entry.score = @entry.score + params[:score_to_add].to_i

        if @entry.save
            render json: @entry, flag: "add_score"
        else
            render json: {status: "Error", errors: @entry.errors}
        end
    end
end
