# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(, )
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  has_and_belongs_to_many :packs
  has_and_belongs_to_many :orders
  has_many :characteristics, dependent: :destroy
  accepts_nested_attributes_for :characteristics, allow_destroy: true

  validate :check_attributes
  validates :price, presence: true, numericality: true

  private

  def check_attributes
    if characteristics.blank?
      errors.add(:characteristics, 'no puede esta vacio')
    end
  end
end
