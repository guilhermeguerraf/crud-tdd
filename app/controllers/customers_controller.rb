class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Cliente cadastrado com sucesso.'
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: 'Cliente atualizado com sucesso.'
    else
      render 'edit'
    end
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: 'Cliente excluído com sucesso.'
    else
      redirect_to customers_path
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :phone, :avatar, :smoker)
  end
end
