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
end
