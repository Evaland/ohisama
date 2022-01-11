class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member # 外部キー
      t.references :orderitem  # 外部キー
      t.integer :category_namename, null: false #
      t.integer :date, null: false #
      t.integer :time_limit, null: false #
      t.integer :status, null: false #
      t.datetime :order_time, null: false #

      t.timestamps
    end
  end
end
