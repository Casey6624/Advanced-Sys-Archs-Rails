class Profile < ApplicationRecord
    has_one_attached :profileImg
    has_one :user
end
