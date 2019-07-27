class RemoveAuthorFromSellDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :sell_details, :Sell_id, :integer
  end
end
