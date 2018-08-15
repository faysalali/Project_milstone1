class TimeLog < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :hours, presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :get_month_timelogs, -> { joins(:project).where('time_logs.created_at >= ? AND time_logs.created_at <= ?', Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).group('time_logs.project_id').sum(:hours)
 }
  scope :get_year_timelogs, -> { group('extract(month from time_logs.created_at)').sum(:hours) }
end
