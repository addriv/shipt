class ProductsController < ApplicationController
  def by_date_range
    start_date = Time.parse(params[:start_date])
    end_date = Time.parse(params[:start_date])
    interval = params[:interval]
    
  end
end
