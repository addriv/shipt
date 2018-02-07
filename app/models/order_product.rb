# == Schema Information
#
# Table name: order_products
#
#  id         :integer          not null, primary key
#  order_id   :integer          not null
#  product_id :integer          not null
#  quantity   :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderProduct < ApplicationRecord
  validates :order_id, :product_id, :quantity, presence: true
  validates :order_id, uniqueness: {scope: :product_id}
end
