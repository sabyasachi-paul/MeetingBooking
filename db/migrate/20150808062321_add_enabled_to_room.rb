class AddEnabledToRoom < ActiveRecord::Migration
  def up
    add_column :rooms, :is_enabled, :boolean, default: true
  end

  def down
    remove_column :rooms, :is_enabled
  end
end
