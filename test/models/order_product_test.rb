# == Schema Information
#
# Table name: order_products
#
#  id          :integer          not null, primary key
#  order_id    :integer          not null
#  product_id  :integer          not null
#  order_count :decimal(, )      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
