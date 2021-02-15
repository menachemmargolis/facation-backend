class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_photo, :forground_photo, :vacations, :images

  has_many :vacations
end
