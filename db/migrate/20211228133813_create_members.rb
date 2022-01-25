class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name, null: false #ユーザー名
      t.string :adress, null: false #ユーザ
      t.string :user_id, null: false #ユーザID
      t.integer :group, null: false #地域分け
      t.boolean :regular_member, default: false #定期便を買っているかどうか
      t.boolean :admin_member, default:false #管理者であるか否か

      t.timestamps
    end
  end
end
