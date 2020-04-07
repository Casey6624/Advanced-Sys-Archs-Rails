class Profile < ApplicationRecord
    has_one_attached :profileImg
    has_one :user
    accepts_nested_attributes_for :user
end
