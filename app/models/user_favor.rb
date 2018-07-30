class UserFavor < ApplicationRecord
  belongs_to :requester
  belongs_to :requestee
  belongs_to :favor
end
