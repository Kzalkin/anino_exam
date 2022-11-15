class Admin::LeaderboardController < ApplicationController
    def create
        @board = Board.new(board_params)

        if @board.save
            render json: @board
        else
            render json: {status: "Error", errors: @board.errors}
        end
    end

    private

    def board_params
        params.permit(:name)
    end
end
