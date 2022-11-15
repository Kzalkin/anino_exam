class ApplicationController < ActionController::API
    def check_token
        header = request.headers['Authorization']
        header = header.split(' ').last if header

        begin
            @decoded = JsonWebToken.decode(header)
            
            render json: {errors: "Invalid token", status: "Unauthorized"} unless @decoded[:status] == "Success"
        rescue JWT::DecodeError => e
            render json: {errors: e.message, status: "Unauthorized"}
        end
    end
end
