class Pack < Product
  has_and_belongs_to_many :products
end