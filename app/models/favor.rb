class Favor < ApplicationRecord
  has_many :user_favors
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :requester, class_name: 'User', foreign_key: "requester_id"

  validates :name, presence: true
  validates :description, presence: true
  validate :date_is_in_future


  def date_is_in_future
    if date < Time.now
      errors.add(:date, "cannot be in the past")
    end
  end

  def self.unselected_favors
    user_favor_favor_ids = UserFavor.all.map {|user_favor| user_favor.favor_id}
    self.all.reject do |favor|
      user_favor_favor_ids.any? {|favor_id| favor_id == favor.id}
    end
  end

  def parsed_datetime
    self.date.strftime("%B %d, %Y at %H:%M")
  end

end
