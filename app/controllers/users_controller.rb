class UsersController < ApplicationController

    def show
        user = User.find(params[:id])
        render json: user
    end


    def create 
        user = User.create(new_user_params)
    end
    
    def edit 
        
    end

    private

    def new_user_params
     params.permit(:name)
    end

end
