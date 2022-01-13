class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member # 外部キー
      t.references :orderitem  # 外部キー
      t.integer :date, null: false #発注日
      t.integer :time_limit, null: false #到着までの時間
      t.integer :status, null: false #発送ランク
      t.datetime :order_time, null: false #発注時間

      t.timestamps
    end
  end
end
