class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @name = @user.name
    @email = @user.email
    @items = @user.items    
  end
end
