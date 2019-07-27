class AddColumnSelldtails < ActiveRecord::Migration[5.2]
  
  def down
  	  remove_column :sell_details, :Sell_id, :integer
  end
end
