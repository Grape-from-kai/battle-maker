class RenameEventIdColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    rename_column :participant_managements, :event_id, :battle_id
  end
end
