class AddShipStatusToSells < ActiveRecord::Migration[5.2]
  def change
    add_column :sells, :ship_status, :string
  end
end
