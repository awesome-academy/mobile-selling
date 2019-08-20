class BillDetail < ApplicationRecord
  belongs_to :from_product, class_name: Product.name, foreign_key: :product_id
  belongs_to :from_cart, class_name: Cart.name, foreign_key: :product_id
  validates :payment_method, acceptance: true
end
