class PaymentsController < ApplicationController
  before_action :set_payment, only: [:edit, :update]
  before_action :set_project, only: [:new, :create, :edit, :update]
  before_action :validate_user, only: [:new, :create, :edit, :update]

  def new
    @payment = Payment.new
  end

  def create
    @payment = @project.payments.create(payment_params)
  end

  def update
    @payment.update(payment_params)
  end

  private

    def set_project
      @project = Project.find params[:project_id]
    end

    def payment_params
      params.require(:payment).permit(:amount)
    end

    def set_payment
      @payment = Payment.find params[:id]
    end

    def validate_user
      redirect_to projects_path(@payment.project) , alert: 'You are not Authorized to Perform this Action.' unless current_user.admin? || current_user.manager?
    end
end
