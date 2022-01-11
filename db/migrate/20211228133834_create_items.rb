class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :regular # 外部キー
      t.references :category # 外部キー
      t.references :orderitem  # 外部キー
      t.string :item_name, null: false #
      t.integer :price, null: false #
      t.integer :item_quantity, null: false #
      t.boolean :disable, null: false #


      t.timestamps
    end
  end
end
