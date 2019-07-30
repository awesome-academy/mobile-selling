class Product < ApplicationRecord
  belongs_to :from_catergory, class_name: Catergory.name, foreign_key: :catergory_id
  has_many :feedbacks
  has_many :bill_details

  enum status: [ :new, :old ]
  validates :catergory_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :amout, presence: true
end
