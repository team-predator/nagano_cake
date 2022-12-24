class Public::HomesController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top, :about]
  
  def top
    #新着商品を取得
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
