class Image < ApplicationRecord
    belongs_to :vacation
    include Magick
   def composite_image
    
    # byebug
    fg = ImageList.new(User.first.forground_photo)
    bg = ImageList.new(self.url)
    image = bg.composite(fg, SouthGravity, SrcOverCompositeOp)
    image.write("Photos/#{self.id}.jpeg")
    self.update(url: File.expand_path("Photos/#{self.id}.jpeg"))
   end









end


