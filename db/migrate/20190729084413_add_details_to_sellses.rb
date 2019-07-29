class AddDetailsToSellses < ActiveRecord::Migration[5.2]
  def change
    add_column :sells, :deleted_at, :datetime
    add_index :sells, :deleted_at
  end
end
