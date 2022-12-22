class Public::OrdersController < ApplicationController
    
  def new
    @order = Order.new
  end
    
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end
    
  def complete
  end

  def index
  end

  def show
  end
    
  private
    
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :status, :payment_method, :postal_code, :address, :name)
  end
    
end
