class Vacation < ApplicationRecord
    belongs_to :user
    belongs_to :companion
    has_many :images

end
