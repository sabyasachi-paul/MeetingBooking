class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :bookings
  before_create :set_default_role
  ADMIN_ROLE = "admin"
  def fullname
    [first_name, last_name].join(" ")
  end
  def is_admin?
    role.name == ADMIN_ROLE ? true : false
  end
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('default')
  end
end
