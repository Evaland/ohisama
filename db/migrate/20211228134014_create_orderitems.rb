class CreateOrderitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderitems do |t|
      t.boolean :orderitem_cancel, null: false #
      t.integer :orderitem_quantity, null: false #
      t.references :order #外部キー
      t.references :item #外部キー

      t.timestamps
    end
  end
end
