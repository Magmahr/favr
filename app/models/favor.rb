class Favor < ApplicationRecord
  has_many :user_favors
  has_many :comments
end
