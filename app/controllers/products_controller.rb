class ProductsController < ApplicationController
  def sold_by_date_range
    start_date = params[:start_date]
    end_date = params[:start_date]
    interval = params[:interval]

    list = Product.sold_by_date_range(start_date, end_date, interval)
    @sales = Product.format_sold_by_date_range(list)

    respond_to do |format|
      format.json
      format.csv { send_data ToCSV.to_csv(list, ["date_start", "product_id", "name", "quantity_sold"]),
        filename: "orders-by-#{interval}.csv" }
    end
  end
end
