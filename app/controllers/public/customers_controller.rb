class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:cuctomer).permit(:last_mane, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
