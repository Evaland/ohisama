class Item < ApplicationRecord
    belongs_to :author_regular, class_name: "Regular", foreign_key: "regular_id", optional: true
    belongs_to :author_category, class_name: "Category", foreign_key: "category_id", optional: true
    has_many :orderitems, dependent: :destroy
    has_many :orders, through: :orderitems

    validates :item_name, presence: true,
    allow_blank: true,
    uniqueness: true

    validates :price, presence: true,
        numericality: {
          greater_than: 0,
          less_than: 100000,
          allow_blank: true,
          message: :invalid_item_price
    }

    validates :item_quantity, presence: true,
        numericality: {
          greater_than: 5,
          less_than: 2000,
          allow_blank: true,
          message: :invalid_item_item_quantity
    }

    validates :disable, presence: true

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
