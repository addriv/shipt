class ProductsController < ApplicationController
  def sold_by_date_range
    start_date = params[:start_date]
    end_date = params[:start_date]
    interval = params[:interval]

    @sales = Product.sold_by_date_range(start_date, end_date, interval)
  end
end
