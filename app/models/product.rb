class Product < ApplicationRecord
  PRODUCT_PARAMS = %i(name color price amout image status discount catergory_id).freeze
  attr_accessor :remote_image_url
  enum status: {news: 0, old: 1}
  belongs_to :catergory
  has_many :feedbacks

  validates :catergory_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :amout, presence: true

  mount_uploader :image, ImageUploader

  has_many :line_items
  before_destroy :check_if_has_line_item

private
  def check_if_has_line_item
    if line_items.empty?
        return true
    else
      errors.add(:base, 'This product has a LineItem')
      return false
    end
  end
end
