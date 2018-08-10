class Payment < ApplicationRecord
  belongs_to :project

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :ordered, -> { order(id: :desc) }
end
