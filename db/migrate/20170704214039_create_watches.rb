class CreateWatches < ActiveRecord::Migration[5.1]
  def up
    create_table :watches do |t|
      t.references :auction, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end

  end

  def down

    drop_table :watches
  end

end
