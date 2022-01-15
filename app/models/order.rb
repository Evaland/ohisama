class Order < ApplicationRecord
    belongs_to :author_member, class_name: "Member", foreign_key: "member_id"
    belongs_to :author_orderitem, class_name: "Orderitem", foreign_key: "orderitem_id"
end
