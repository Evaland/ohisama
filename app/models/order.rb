class Order < ApplicationRecord
    belongs_to :author_member, class_name: "Member", foreign_key: "member_id"
    has_many :orderitems, dependent: :destroy
    has_many :author_items, through: :orderitems, source: :item
    accepts_nested_attributes_for :orderitems
end
