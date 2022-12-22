class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "2"
      @address = Address.find(params[:order][:address_id])
    elsif params[:order][:address_option] == "3"
    end
    @cart_items = current_customer.cart_items.all
    @order.shipping_cost = 800
    @total = 0
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :status, :payment_method, :postal_code, :address_id, :name)
  end

end
