class User < ApplicationRecord
    validates :name, {presence: true}
    validates :password, {presence: true, uniqueness: true}
    validates :bio, {length: {maximum: 280}}
end
