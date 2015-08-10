class AddUniqueToHoliday < ActiveRecord::Migration
  def change
    add_index :holidays, :date, :unique => true
  end
end
