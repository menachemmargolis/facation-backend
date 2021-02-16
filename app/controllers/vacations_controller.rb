require 'rest-client'

class VacationsController < ApplicationController
   

   

    def create
        vacation = Vacation.create(new_vacation_params)
    end

    def locations 
      
      location = params[:location]
      url = "https://api.unsplash.com/search/photos?client_id=#{Figaro.env.unsplash_api_key}&query=#{location}&page=#{params[:number]}&per_page=3"
      response = RestClient.get(url)
      body = response.body
      parsed = JSON.parse(body)

      render json: parsed["results"]
    end
    
    
      private
    
      def new_vacation_params
        params.permit(:location, :user_id)
      end
end
