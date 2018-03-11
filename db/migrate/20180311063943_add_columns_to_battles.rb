class AddColumnsToBattles < ActiveRecord::Migration[5.1]
  def change
    add_column :battles, :latitude, :float
    add_column :battles, :longitude, :float
  end
end
