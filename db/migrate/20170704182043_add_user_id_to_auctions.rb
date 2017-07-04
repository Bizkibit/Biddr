class AddUserIdToAuctions < ActiveRecord::Migration[5.1]
  def up
    add_reference :auctions, :user, foreign_key: true
  end

  def down
    remove_reference :auctions, :user
  end

end
