class Auction < ApplicationRecord

  has_many :bids, dependent: :destroy
  belongs_to :user

  has_many :watches, dependent: :destroy
  # has_many :users, through: :watches
  has_many :watchers, through: :watches, source: :user

  include AASM

  aasm whiney_transitions: false do
    state :draft, intial: true
    state :published, :reserve_met, :won, :cancelled, :reserve_not_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :expire do
      transitions from: :published, to: :reserve_not_met
    end

    event :cancel do
      transitions from: :published, to: :cencelled
    end

    
  end

end
