class Member < ApplicationRecord
    has_many :regulars, dependent: :destroy
    has_many :orders, dependent: :destroy
end
