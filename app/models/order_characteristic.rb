class OrderCharacteristic < ApplicationRecord
  belongs_to :characteristic
  belongs_to :order
end
