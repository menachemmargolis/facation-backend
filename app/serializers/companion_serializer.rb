class CompanionSerializer < ActiveModel::Serializer
  attributes :id, :name, :image

  has_many :vacations
end
