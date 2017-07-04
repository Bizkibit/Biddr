class Watch < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  validates :auction_id, uniqueness: {
  scope: :user_id,
  message: "has already been watched"
  }
end
