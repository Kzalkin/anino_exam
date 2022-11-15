class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user
        else
            render json: {status: "Error", errors: @user.errors}
        end
    end

    private

    def user_params
        params.permit(:name)
    end
end
