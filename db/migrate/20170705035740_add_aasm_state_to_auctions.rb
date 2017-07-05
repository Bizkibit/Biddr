class AddAasmStateToAuctions < ActiveRecord::Migration[5.1]
  def up
    add_column :auctions, :aasm_state, :string
  end

  def down
    remove_column :auctions, :aasm_state
  end
end
