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
class Characteristic < ApplicationRecord
  belongs_to :product
end
