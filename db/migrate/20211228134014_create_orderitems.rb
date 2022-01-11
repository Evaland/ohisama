class CreateOrderitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderitems do |t|
      t.boolean :orderitem_cancel, null: false #
      t.integer :orderitem_quantity, null: false #
      t.integer :order_id, null: false #
      t.integer :item_id, null: false #

      t.timestamps
    end
  end
end
