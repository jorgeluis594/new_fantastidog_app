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
class Order < ApplicationRecord
  belongs_to :delivery
  has_and_belongs_to_many :products
  has_and_belongs_to_many :packs
end
