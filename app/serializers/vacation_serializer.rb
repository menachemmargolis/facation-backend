class VacationSerializer < ActiveModel::Serializer
  attributes :id, :location
  
  has_many :images
end
