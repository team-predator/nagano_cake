class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new

    @item = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  def show
  end

  def edit
  end

private
  def list_params
    params.require(:Item).permit(:name, :introduction, :price, :image)
  end
end
