class Item < ApplicationRecord
    belongs_to :author_regular, class_name: "Regular", foreign_key: "regular_id", optional: true
    belongs_to :author_category, class_name: "Category", foreign_key: "category_id", optional: true
    has_many :orderitems, dependent: :destroy
    has_many :author_orders, through: :orderitems, source: :order


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
