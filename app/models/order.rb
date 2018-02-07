# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  customer_id :integer          not null
#  status      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ApplicationRecord
  validates :customer_id, :status, presence: true
  validates :status, inclusion: {in: ["waiting for delivery", "on its way", "delivered"]}

  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products, source: :product

  def self.customer_category_purchases
    ActiveRecord::Base.connection.execute(OrdersSQL.customer_category_purchases)
  end

  def self.find_by_date(start_date, end_date, range)
  end 
end
