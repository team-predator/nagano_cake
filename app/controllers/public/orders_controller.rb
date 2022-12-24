class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "3"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items.all
    @order.shipping_cost = 800
    @total = 0
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.price*1.08).floor
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = Order.where(customer_id:current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all

  end

  private

  def address_params
    params(:address).permit(:customer_id, :address, :postal_code, :name)
  end

  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :status, :payment_method, :postal_code, :address, :name)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :is_active, :making_status)
  end


end
