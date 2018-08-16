class Project < ApplicationRecord
  has_many :assign_users
  has_many :users, through: :assign_users
  has_many :time_logs
  has_many :payments
  has_many :comments, dependent: :destroy
  has_many :attachments, as: :attachable, inverse_of: :attachable, dependent: :destroy

  belongs_to :client

  accepts_nested_attributes_for :attachments, allow_destroy: true

  validates :title, :description, :price, :end_date, :status, presence: true

  enum status: [:active, :pending, :completed]
end
