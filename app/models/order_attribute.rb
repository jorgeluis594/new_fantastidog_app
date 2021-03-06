class OrderAttribute < ApplicationRecord
  belongs_to :attribute
  belongs_to :order
end
