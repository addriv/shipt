# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :name, presence: true

  has_many :product_categories, class_name: :ProductCategory
  has_many :products, through: :product_categories, source: :product
end
