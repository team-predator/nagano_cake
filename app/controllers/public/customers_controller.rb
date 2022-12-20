class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
  end

  def unsubscribe
  end

  private

  def customer_params
    params.require(:cuctomer).permit(:last_mane, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
