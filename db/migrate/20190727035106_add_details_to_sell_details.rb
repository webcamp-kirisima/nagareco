class AddDetailsToSellDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_details, :sell_id, :integer
  end
end
