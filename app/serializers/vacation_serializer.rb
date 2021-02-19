class VacationSerializer < ActiveModel::Serializer
  attributes :id, :location, :video
  
  has_many :images
end
