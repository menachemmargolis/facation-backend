class CompanionsController < ApplicationController

    def index
        companions = Companion.all
        render json: companions
    end
end
