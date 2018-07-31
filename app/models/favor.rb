class Favor < ApplicationRecord
  has_many :user_favors
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :requester, class_name: 'User', foreign_key: "requester_id"

  validates :name, presence: true
  validates :description, presence: true
  # validate :date_is_in_future


  def date_is_in_future
    if date < Time.now
      errors.add(:date, "cannot be in the past")
    end
  end
end
