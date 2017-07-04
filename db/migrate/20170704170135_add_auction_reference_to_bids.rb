class AddAuctionReferenceToBids < ActiveRecord::Migration[5.1]
  def up
    add_reference :bids, :auction, foreign_key: true
  end

  def down
    remove_reference :bids, :auction
  end
end
