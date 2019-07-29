class AddDefaultToSell < ActiveRecord::Migration[5.2]
  def change
    change_column_default :sells, :ship_status, "受付"
  end
end
