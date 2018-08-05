class Project < ApplicationRecord
  has_many :assign_users
  has_many :users, through: :assign_users
  has_many :payments
  belongs_to :client  

  validates :title, :description, :price, :end_date, :status, presence: true
  
  enum status: [:active, :pending, :completed]
  
end
