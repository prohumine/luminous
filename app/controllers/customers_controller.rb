class CustomersController < ApplicationController

  def index
  	@customers = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save?
  		redirect_to customers_path
  	else
  		render new
  	end
  end

  def edit
  end

  def update
  	@user = User.find(params[:id])
  	@customer = @user.customer.build(customer_params)
  	if @customer.save?
  		redirect_to customers_path
  	else
  		render edit
  	end
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	@customer.destroy
    if @customer.destroy?
      redirect_to customer_path
    else
      notice: 'Customer not found'
    end
  end

  private

  def customer_params
  	params.require(:customer).permit(:name, :email, :phone, :address)
  end
end
