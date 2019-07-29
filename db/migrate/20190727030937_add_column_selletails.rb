class AddColumnSelletails < ActiveRecord::Migration[5.2]
  def up
  	  add_column :sell_details, :quantity, :integer
  end
end
