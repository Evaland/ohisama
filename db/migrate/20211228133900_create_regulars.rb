class CreateRegulars < ActiveRecord::Migration[5.2]
  def change
    create_table :regulars do |t|
      t.references :member # 外部キー
      t.references :item #外部キー
      t.integer :regular_quantity, null: false #
      t.datetime :update_at, null: false #

      t.timestamps
    end
  end
end
