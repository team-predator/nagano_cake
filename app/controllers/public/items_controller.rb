class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private

  def item_params
    params.require(:items).permit(:name, :introduction, :price, :image, :is_active)
  end

end
