class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.datetime :date
      t.boolean :is_enabled, default: true
      t.timestamps null: false
    end
  end
end
