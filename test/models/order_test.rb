# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  pet_name      :string
#  owner_name    :string
#  delivery_date :date
#  delivery_id   :bigint           not null
#  delivery_cost :decimal(, )
#  discount      :decimal(, )
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
