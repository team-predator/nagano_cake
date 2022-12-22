class Public::ItemsController < ApplicationController

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
