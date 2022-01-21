class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member # 外部キー
      t.references :orderitem  # 外部キー
      t.integer :date #発注日
      t.integer :time_limit #到着までの時間
      t.integer :status #発送ランク
      t.datetime :order_time #発注時間
      t.integer :order_quantity

      t.timestamps
    end
  end
end
