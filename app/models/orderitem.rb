class Orderitem < ApplicationRecord
    has_many :items, dependent: :destroy
    has_many :orders, dependent: :destroy

    def add_item(item_id)
        Orderitems.find_or_initialize_by(item_id: item_id)
    end
end
