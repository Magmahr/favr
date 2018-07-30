class User < ApplicationRecord
  # has_many :user_favors
  has_many :requests, class_name: "UserFavor", foreign_key: "requester_id"
  has_many :fulfillments, class_name: "UserFavor", foreign_key: "requestee_id"
  has_many :favors, through: :user_favors
  has_many :reviews, through: :favors
  has_many :comments
end
