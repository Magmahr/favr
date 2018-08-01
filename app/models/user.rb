class User < ApplicationRecord
  has_secure_password
  has_many :user_favors
  has_many :requests, class_name: "UserFavor", foreign_key: "requester_id"
  has_many :fulfillments, class_name: "UserFavor", foreign_key: "requestee_id"
  has_many :favors, through: :user_favors, dependent: :destroy
  has_many :reviews, through: :favors, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def accepted_favors
    accepted_user_favors = UserFavor.select {|user_favor| user_favor.requestee_id == self.id}
    accepted_user_favors.map {|user_favor| user_favor.favor}
  end

end
