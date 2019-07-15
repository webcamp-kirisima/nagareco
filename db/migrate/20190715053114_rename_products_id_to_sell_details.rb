class RenameProductsIdToSellDetails < ActiveRecord::Migration[5.2]
  def change
  	rename_column :sell_details, :products_id, :product_id
  end
end
