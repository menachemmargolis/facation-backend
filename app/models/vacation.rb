class Vacation < ApplicationRecord
    belongs_to :user
    belongs_to :companion
    has_many :images


def create_video

# gem install transloadit
transloadit = Transloadit.new(
    :key => Figaro.env.transloadit_key,
    :secret => Figaro.env.transloadit_secret
  )
  
  
  original = transloadit.step ":original", "/upload/handle"
  song = transloadit.step "song", "/http/import",
    :result => true,
    :url => "http://jakesallstarkaraoke.com/media/Beach_Boys_-_Good_Vibrations.mp3"
   
  merged = transloadit.step "merged", "/video/merge",
    :use => {"steps":[{"name":":original","as":"image"},{"name":"song","as":"audio"}],"bundle_steps":true},
    :result => true,
    :duration => 15,
    :ffmpeg_stack => "v4.3.1",
    :framerate => "1/3",
    :preset => "ipad-high",
    :resize_strategy => "fit"
  
  
  assembly = transloadit.assembly(
    :steps => [ original, song, merged]
  )
  
  # Add files to upload
  files = []

  self.images.each{ |image| files.push(open(image.url))}
#   files.push(open("/Users/Basya/flatiron/module3/project/facation-backend/Photos/31.jpeg"))
#   files.push(open("./Photos/32.jpeg"))
#   files.push(open("./Photos/33.jpeg"))
#   files.push(open("./Photos/23.jpeg"))
#   files.push(open("./Photos/24.jpeg"))
#   files.push(open("./Photos/25.jpeg"))
  
  
  # Start the Assembly
  response = assembly.create! *files
  
  until response.finished?
    sleep 1; response.reload!
  end
  
  if !response.error?
    self.update(video: response.body["results"]['merged'][0]["url"]) 
  else
    puts response.body["error"]
  end

  
  

end
  

end
