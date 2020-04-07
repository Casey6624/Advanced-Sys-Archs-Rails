class User < ApplicationRecord
    validates_uniqueness_of :username
    has_secure_password validations: false
end
