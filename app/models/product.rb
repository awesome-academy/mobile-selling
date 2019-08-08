class Product < ApplicationRecord
  PRODUCT_PARAMS = %i(name color price amout image status discount catergory_id).freeze
  attr_accessor :remote_image_url
  enum status: {news: 0, old: 1}
  belongs_to :catergory
  has_many :feedbacks
  has_many :bill_details

  validates :catergory_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :amout, presence: true

  mount_uploader :image, ImageUploader
end
