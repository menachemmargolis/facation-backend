class VacationsController < ApplicationController

    def create
        vacation = Vacation.create(new_vacation_params)
    end
    
    
      private
    
      def new_vacation_params
        params.permit(:location, :user_id)
      end
end
