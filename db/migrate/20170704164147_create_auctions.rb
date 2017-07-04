class CreateAuctions < ActiveRecord::Migration[5.1]
  def up
    create_table :auctions do |t|
      t.string :title
      t.text :detail
      t.date :end_on
      t.integer :reserve_price

      t.timestamps
    end
  end

  def down
    drop_table :actions
  end
end
