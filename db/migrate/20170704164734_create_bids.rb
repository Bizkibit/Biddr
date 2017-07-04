class CreateBids < ActiveRecord::Migration[5.1]
  def up
    create_table :bids do |t|
      t.integer :price

      t.timestamps
    end
  end

  def down
    drop_table :bids
  end
end
