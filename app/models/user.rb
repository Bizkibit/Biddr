class User < ApplicationRecord
  validates :email, presence: true
  has_many :bids
  has_many :auctions
end
