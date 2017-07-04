class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  has_many :bids
  has_many :auctions

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
