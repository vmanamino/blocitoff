class ItemsController < ApplicationController  
  def create
    @user = current_user
    authorize @user
    @item = current_user.items.build(params.require(:item).permit(:name))
    @item.user = @user
    if @item.save
      flash[:notice] = 'Item was saved'
      redirect_to [@user]
    else
      flash[:error] = 'There was an error, your item was not saved!'
      render :new
    end
  end
end
