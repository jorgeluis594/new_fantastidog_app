class Order < ApplicationRecord
  belongs_to :delivery
  has_and_belongs_to_many :products
  has_and_belongs_to_many :packs
end
