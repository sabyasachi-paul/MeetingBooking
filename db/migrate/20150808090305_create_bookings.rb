class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :type
      t.datetime :start
      t.datetime :end
      t.references :user
      t.references :room 
      t.timestamps null: false
    end
  end
end
