# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  validates :name, presence: true
  
  has_many :product_categories
  has_many :categories, through: :product_categories, source: :category
  has_many :order_products

  def self.sold_by_date_range(start_date, end_date, interval)
    ActiveRecord::Base.connection.execute(
      ProductsSQL.sold_by_date_range(start_date, end_date, interval)
    )
  end

  def self.format_sold_by_date_range(sales)
    formatted_hash = Hash.new { |h,k| h[k] = [] }
    sales.each do |sale| 
      formatted_hash[sale["date_start"]] << {
        product_id: sale["product_id"],
        name: sale["name"],
        quantity_sold: sale["quantity_sold"]
      }
    end

    formatted_hash
  end
end
