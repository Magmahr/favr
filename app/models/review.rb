class Review < ApplicationRecord
  belongs_to :favor
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true
  validates :title, presence: true

end
