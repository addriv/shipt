class CustomersController < ApplicationController
  def show
    user = Customer.find_by_id(params[:id])
    if user
      @orders = user.orders
      render :show
    else
      render json: ['No customer found'], status: 404
    end
  end
end
