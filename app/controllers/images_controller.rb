class ImagesController < ApplicationController

  def create
    image = image.create(new_image_params)
  end


  private

  def new_image_params
    params.permit(:url, :vacation_id)
  end
end
