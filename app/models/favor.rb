class Favor < ApplicationRecord
  has_many :user_favors
  has_many :comments
  belongs_to :requester, class_name: 'User', foreign_key: "requester_id"
end
