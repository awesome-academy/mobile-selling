class BillDetail < ApplicationRecord
  belongs_to :from_product, class_name: Product.name, foreign_key: :product_id
  belongs_to :from_bill, class_name: Bill.name, foreign_key: :product_id
  validates :payment_method, acceptance: true
end
