class Public::HomesController < ApplicationController
  def top
    #新着商品を取得
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
