class Orderitem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    def sum_of_price
        item.price * orderitem.orderitem_quantity
    end
end
