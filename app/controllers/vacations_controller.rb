require 'rest-client'

class VacationsController < ApplicationController
   

   

    def create
        user = User.find_by(name: params[:name])
        vacation = Vacation.create(user_id: user.id, companion_id: new_vacation_params[:companion], location: new_vacation_params[:location])
        new_vacation_params[:images].each{|image| vacation.images.create(url: image)}
        
        vacation.images.each{|image| image.composite_image(user)}
        vacation.create_video
        
        render json: vacation
    end

    def locations 
      
      location = params[:location]
      url = "https://api.unsplash.com/search/photos?client_id=#{Figaro.env.unsplash_api_key}&query=#{location}&page=#{params[:number]}&per_page=3&orientation=landscape"
      response = RestClient.get(url)
      body = response.body
      parsed = JSON.parse(body)

      render json: parsed["results"]
    end
    
    
      private
    
      def new_vacation_params
        params.permit(:location, :user_id, :companion, :images => [])
      end
end
