class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_photo, :forground_photo, :vacations, :images, :companions

  has_many :vacations
end
