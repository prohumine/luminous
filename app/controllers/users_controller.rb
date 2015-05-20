class UsersController < ApplicationController
  include SessionsHelper

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      
  		redirect_to @user
      flash[:success] = "Successfully signed up welcome #{@user.name}"
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
