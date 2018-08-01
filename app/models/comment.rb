class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :favor
  # validate :only_participants_can_post
  validates :content, presence: true

  def only_participants_can_post
    # byebug
    user_favor = UserFavor.find(favor_id)
      unless user_favor.requester_id == current_user.id || user_favor.requestee_id == current_user.id
        # byebug
      errors.add(:comment, "You cannot comment on this post")
      end

  end

end
