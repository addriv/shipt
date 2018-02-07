class OrdersController < ApplicationController
  def customer_category_purchases
    @purchases_by_category = Order.customer_category_purchases
  end
end
