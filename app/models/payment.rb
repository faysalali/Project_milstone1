class Payment < ApplicationRecord
  belongs_to :project
  
  validates :amount, presence: true
  
  scope :ordered, -> { order(id: :desc) }
  
end
