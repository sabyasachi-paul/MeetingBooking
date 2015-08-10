class Holiday < ActiveRecord::Base
  validates :date, uniqueness: true
end
