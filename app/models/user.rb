class User < ApplicationRecord
  # has_secure_password
  has_many :user_favors
  has_many :requests, class_name: "UserFavor", foreign_key: "requester_id"
  has_many :fulfillments, class_name: "UserFavor", foreign_key: "requestee_id"
  has_many :favors, through: :user_favors, dependent: :destroy
  has_many :reviews, through: :favors, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
