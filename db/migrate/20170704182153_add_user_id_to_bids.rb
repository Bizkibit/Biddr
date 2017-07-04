class AddUserIdToBids < ActiveRecord::Migration[5.1]
  def up
    add_reference :bids, :user, foreign_key: true
  end

  def down
    remove_reference :bids, :user
  end
end
