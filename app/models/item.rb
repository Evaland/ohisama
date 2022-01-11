class Item < ApplicationRecord
    belongs_to :author, class_name: "Regular", foreign_key: "regular_id", optional: true
    belongs_to :author, class_name: "Category", foreign_key: "category_id", optional: true
    belongs_to :author, class_name: "Orderitem", foreign_key: "orderitem_id", optional: true
end
