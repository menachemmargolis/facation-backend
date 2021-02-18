

class UsersController < ApplicationController
    
    
    def show
        user = User.find_by(name: params[:name])
        render json: user
    end





    def create 
        user = User.create(user_params)
        render json: user
    end
    
    def update 
        user = User.find(params[:id])
        user.update(user_params)
        user.remove_background
        
        render json: user
    end

    private

    def user_params
     params.permit(:name, :profile_photo, :forground_photo)
    end

end
