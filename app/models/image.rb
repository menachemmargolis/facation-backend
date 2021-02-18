class Image < ApplicationRecord
    belongs_to :vacation
    include Magick
   def composite_image
    
    
    user = ImageList.new(User.first.forground_photo)
    small_user = user.scale(0.75)
    companion = ImageList.new(self.vacation.companion.image)
    small_companion = companion.scale(0.75)
    bg = ImageList.new(self.url)
    image1 = bg.composite(small_companion, SouthEastGravity, SrcOverCompositeOp)
    image = image1.composite(small_user, SouthWestGravity, SrcOverCompositeOp)
    image.write("Photos/#{self.id}.jpeg")
    self.update(url: File.expand_path("Photos/#{self.id}.jpeg"))
   end









end


