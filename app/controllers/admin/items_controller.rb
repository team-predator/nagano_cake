class Admin::ItemsController < ApplicationController


  def index
    @items = Item.page(params[:page])
  end

  def new

    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre, :image)
  end
end
