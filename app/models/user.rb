class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum status: [:disable, :enable]
  enum role: [:user, :admin, :manager]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :notadmin, -> { where.not(role: :admin) }

  def active_for_authentication?
    super && enable?
  end
  
  def inactive_message
    if enable?
       super
    else
      :not_approved
    end
  end
  
  def enable_disable
    self.disable? ? self.enable! : self.disable!
  end
  
  def change_role
    self.user? ? self.manager! : self.user!
  end
  def isgender
    self.gender ? 'Female' : 'Male'
  end
end
