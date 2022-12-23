class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: { cannnot_make: 0, waiting_make: 1, in_making: 2, make_complete: 3 }

  def subtotal
    price*amount
  end

end
