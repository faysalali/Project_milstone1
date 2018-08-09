class TimeLog < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :hours, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
