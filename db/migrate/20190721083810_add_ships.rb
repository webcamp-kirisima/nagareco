class AddShips < ActiveRecord::Migration[5.2]
  def change
  	  add_column :ships, :last_name, :string

  	  add_column :ships, :first_name, :string
  end
end
