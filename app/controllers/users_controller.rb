

class UsersController < ApplicationController
    
    
    def show
        user = User.find_by(name: params[:name])
        render json: user
    end



   def vacations
    user = User.find_by(name: params[:name])
     vacation = user.vacations
     render json:vacation
   end
   
   def images
    vacation = Vacation.find(params[:id])
     img = vacation.images
     render json: img
   end

    def create 
        user = User.create(user_params)
        render json: user
    end
    
    def update 
        
        user = User.find_by(name: params[:name])
        user.update(user_params)
        user.remove_background
        
        render json: user
    end

    private

    def user_params
     params.permit(:name, :profile_photo, :forground_photo)
    end

end
