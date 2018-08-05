class PaymentsController < ApplicationController
  before_action :find_project, only: [:new, :create, :edit]

  def new
    @payment = Payment.new
  end
  
  def create
    @payment = @project.payments.create(payment_params)
  end

  def edit
    @payment = Payment.find params[:id]
  end
  
  def update
    @payment = Payment.find params[:id]
    @payment.update(payment_params)
    redirect_to project_path(@payment.project), notice: 'Payment updated Successfully.'
  end
  
  private
  
    def find_project
      @project = Project.find params[:project_id]
    end
    
    def payment_params
      params.require(:payment).permit(:amount)
    end
    
end
