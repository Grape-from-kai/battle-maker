class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.string :title
      t.text :content
      t.text :place
      t.datetime :battle_date
      t.integer :user_id

      t.timestamps
    end
  end
end
