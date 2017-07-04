class Auction < ApplicationRecord
  has_many :bids, dependent: :destroy
  belongs_to :user

  has_many :watches, dependent: :destroy
  # has_many :users, through: :watches
  has_many :watchers, through: :watches, source: :user

end
