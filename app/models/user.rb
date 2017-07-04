class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  has_many :bids
  has_many :auctions

  # has_many :watches, dependent: :destroy
  # has_many :watched_posts, through: :watches, source: :auction
  has_many :watches, dependent: :destroy
  has_many :auctions, through: :watches


  def full_name
    "#{first_name} #{last_name}"
  end

end
