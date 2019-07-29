class AddDetailsToSellDetails2 < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_details, :price, :integer
  end
end
