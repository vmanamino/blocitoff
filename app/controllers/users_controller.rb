class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @items = @user.items
  end
end
