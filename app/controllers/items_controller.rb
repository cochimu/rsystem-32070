class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to items_path if @item.destroy
  end

  private
  
  def item_params
    params.require(:item).permit(:content).merge(user_id: current_user.id)
  end
end