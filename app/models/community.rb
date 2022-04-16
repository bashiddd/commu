class Community < ApplicationRecord
    validates :name, {presence: true}
    validates :genre, {presence: true}
    validates :area, {presence: true}
    validates :detail, {presence: true}
    validates :image_name1, {presence: true}
    validates :image_name2, {presence: true}
    validates :image_name3, {presence: true}
    validates :overview, {presence: true}
end
