class Community < ApplicationRecord
    validates :name, {presence: true}
    validates :genre, {presence: true}
    validates :area, {presence: true}
    validates :detail, {presence: true}
    validates :overview, {presence: true}
    validates :age_gender, {presence: true}
    validates :place, {presence: true}
    validates :rule, {presence: true}
end
