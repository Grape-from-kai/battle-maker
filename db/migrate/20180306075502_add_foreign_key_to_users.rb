class AddForeignKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :battles, :users, column: :user_id
  end
end