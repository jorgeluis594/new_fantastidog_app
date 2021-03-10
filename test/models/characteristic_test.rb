# == Schema Information
#
# Table name: characteristics
#
#  id         :bigint           not null, primary key
#  name       :string
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CharacteristicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
