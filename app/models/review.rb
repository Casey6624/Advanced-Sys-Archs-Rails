class Review < ApplicationRecord
    has_one :product
    has_one :profile
end
