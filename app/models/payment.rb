class Payment < ApplicationRecord
  belongs_to :project

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :ordered, -> { order(id: :desc) }
  scope :get_month_payments, -> { joins(:project).where('payments.created_at >= ? AND payments.created_at <= ?', Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).group('payments.project_id').sum(:amount) }
  scope :get_year_payments, -> { group('extract(month from payments.created_at)').sum(:amount) }
end
