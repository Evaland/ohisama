class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.references :member, null: false
      t.references :order, null: false

      t.timestamps
    end
  end
end
