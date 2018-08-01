class UserFavor < ApplicationRecord
  belongs_to :requester, class_name: "User", foreign_key:  "requester_id"
  belongs_to :requestee, class_name: "User", foreign_key: "requestee_id"
  belongs_to :favor

  validate :cannot_do_yourself_a_favor

  def cannot_do_yourself_a_favor
    if requester_id == requestee_id
      errors.add(:requestee_id, "You cannot accept your own favor")
    end
  end

end
