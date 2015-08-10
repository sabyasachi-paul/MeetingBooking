class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :bookings
  ADMIN_ROLE = "admin"
  def fullname
    [first_name, last_name].join(" ")
  end
  def is_admin?
    role.name == ADMIN_ROLE ? true : false
  end
end
