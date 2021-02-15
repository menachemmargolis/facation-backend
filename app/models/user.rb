class User < ApplicationRecord
    has_many :vacations
    has_many :images, through: :vacations
end
