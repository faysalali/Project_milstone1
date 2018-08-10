class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :destroy, :edit, :update]

  def index
    @clients = Client.search(params[:search])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, success: "Client created successfully!"
    else
      render 'new'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, success: "Client updated successfully!"
    else
      render 'edit'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  private

    def client_params
      params.require(:client).permit(:name, :email, :country)
    end

    def set_client
      @client = Client.find(params[:id])
    end
end
