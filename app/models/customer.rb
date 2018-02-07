# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :orders
  has_many :ordered_products, through: :orders, source: :products
end
