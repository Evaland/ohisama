class Item < ApplicationRecord
    belongs_to :author_regular, class_name: "Regular", foreign_key: "regular_id", optional: true
    belongs_to :author_category, class_name: "Category", foreign_key: "category_id", optional: true
    belongs_to :author_orderitem, class_name: "Orderitem", foreign_key: "orderitem_id", optional: true
    attribute :new_category_ids, :intarray, default: []


    class << self
        def search(query)
          rel = order("id")
          if query.present?
              rel = rel.where("item_name LIKE ?",
                  "%#{query}%")
          end
          rel
        end
    end

end
