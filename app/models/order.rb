class Order < ApplicationRecord
    belongs_to :author, class_name: "Member", foreign_key: "member_id"
    belongs_to :author, class_name: "Orderitem", foreign_key: "orderitem_id"
end
