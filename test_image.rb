require 'rmagick'
require 'pry'
include Magick

hasibul = ImageList.new("https://storage.googleapis.com/object-cut-images/565ffeb2-57b6-4697-b423-1f4cccc986af.png")
bg = ImageList.new("https://images.unsplash.com/photo-1486325212027-8081e485255e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80")
image = bg.composite(hasibul, SouthGravity, SrcOverCompositeOp)
image.write("Photos/potato.jpeg")
