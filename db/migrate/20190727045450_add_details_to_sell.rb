class AddDetailsToSell < ActiveRecord::Migration[5.2]
  def change
    add_column :sells, :ship_l_name, :string
    add_column :sells, :ship_f_name, :string
  end
end
