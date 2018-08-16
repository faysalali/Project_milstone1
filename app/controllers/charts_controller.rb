class ChartsController < ApplicationController
  def current_month_payments
    render json: Payment.get_month_payments
  end

  def current_month_timelogs
    render json: TimeLog.get_month_timelogs
  end

  def current_year_payments
    render json: Payment.get_year_payments
  end

  def current_year_timelogs
    render json: TimeLog.get_year_timelogs
  end
end
