class LightsController < ApplicationController
	before_action :set_customer
	
  def new
  	@light = Light.new
  end

  def create
  	@light = @customer.light.build(light_params)
  end

  def edit
  	@light = @customer.light.find(params[:id])
  end

  def show
  	@light = @customer.light.find(params[:id])
  end

  private

  def light_params
  	params.require(:lights).permit(:name, :email, :phone, :address)
  end
end
