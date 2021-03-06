class Attribute < ApplicationRecord
  belongs_to :product
  has_many :order_attributes
end
