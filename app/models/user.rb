class User < ApplicationRecord
  has_many :assign_users
  has_many :projects, through: :assign_users
  has_many :time_logs
  has_many :comments, dependent: :destroy

  enum status: [:disable, :enable]
  enum role: [:user, :admin, :manager]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { medium: "100x100>", thumb: "45x45#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def active_for_authentication?
    super && enable?
  end

  def inactive_message
    enable? ? super : :not_approved
  end

  def update_status
    self.disable? ? self.enable! : self.disable!
  end

  def update_role
    self.user? ? self.manager! : self.user!
  end

  def isgender
    self.gender ? 'Female' : 'Male'
  end
end
