require 'uri'
require 'net/http'
require 'openssl'
require 'json'
class User < ApplicationRecord
    has_many :vacations
    has_many :images, through: :vacations
    validates :name, uniqueness: true
    validates :name, presence: true
    def remove_background

        url = URI("https://background-removal.p.rapidapi.com/remove")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/x-www-form-urlencoded'
        request["x-rapidapi-key"] = Figaro.env.remove_api_key
        request["x-rapidapi-host"] = 'background-removal.p.rapidapi.com'
        request.body = "image_url=#{self.profile_photo}"
        response = http.request(request)
        body = response.body
        parsed = JSON.parse(body)
        self.update(forground_photo: parsed['response']['image_url'])
    end


end
