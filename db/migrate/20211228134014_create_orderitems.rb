class CreateOrderitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderitems do |t|
      t.integer :orderitem_quantity#
      t.references :order #外部キー
      t.references :item #外部キー

      t.timestamps
    end
  end
end
