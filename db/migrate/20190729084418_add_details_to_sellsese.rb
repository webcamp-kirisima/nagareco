class AddDetailsToSellsese < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_details, :deleted_at, :datetime
    add_index :sell_details, :deleted_at
  end
end
