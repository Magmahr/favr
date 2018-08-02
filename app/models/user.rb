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

  def all_favors
    all_user_favors = UserFavor.select {|user_favor| user_favor.requestee_id == self.id || user_favor.requester_id == self.id}
    all_user_favors.map {|user_favor| user_favor.favor}
  end

  def all_favors_ids
    all_favors.map {|favor| favor.id}
  end

  def all_reviews_of_user
    Review.all.select do |review|
      all_favors_ids.include?(review.favor_id) && review.user_id != self.id
    end
  end

  def requested_favors_accepted
    UserFavor.select {|user_favor| user_favor.requester_id == self.id}
  end

  def users_owed
    requested_favors_accepted.map {|userfavor| userfavor.requestee}
  end

  def all_ratings_of_user
    all_reviews_of_user.map {|review| review.rating}
  end

  def average_rating
    if all_ratings_of_user.count > 0
      (all_ratings_of_user.sum / all_ratings_of_user.size.to_f).round(2)
    else
      "0.0 (This user does not have any reviews yet)"
    end
  end

end
