class Room < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :bookings
end
