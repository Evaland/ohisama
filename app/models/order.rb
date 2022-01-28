class Order < ApplicationRecord
    belongs_to :author_member, class_name: "Member", foreign_key: "member_id"
    has_many :orderitems, dependent: :destroy
    has_many :items, through: :orderitems

    has_many :statuses, dependent: :destroy
    has_many :members, through: :statuses
end
