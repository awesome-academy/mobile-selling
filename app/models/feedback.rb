class Feedback < ApplicationRecord
  belongs_to :from_product, class_name: Product.name, foreign_key: :product_id
  validates :rate, inclusion: {in: Settings.rate_value}
  validates :comment, presence: true, length: {maximum: Settings.maxComment}
end
