class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    authorize @user
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:notice] = 'Item was saved'
      redirect_to [@user]
    else
      flash[:error] = 'There was an error, your item was not saved!'
      render :new
    end
  end

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])
    flash[:error] = "Item couldn't be removed, try again" unless @item.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
