class Bill < ApplicationRecord
  belongs_to :from_user, class_name: User.name, foreign_key: :user_id
  has_many :feedbacks
end
